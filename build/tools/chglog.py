#!/usr/bin/env python
#
# Copyright (C) 2014-2017 The MoKee Open Source Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

from datetime import datetime, timedelta
from xml.dom.minidom import parse
import os
import sys
import requests
import subprocess

DEF_BRANCH = 'mkl'
TOKEN_FILE = '.gh_token'

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'

def usage():
    print ''
    print 'Usage: chglog [start date] [end date]'
    print ''
    print 'Generates changelog, if start date and end date not given,'
    print 'assumes starting from yesterday and ends today'
    print ''
    print 'Date format: YYYY-MM-DD'
    print ''

def verifyDateFormat(string):
    date = string.split('-')
    if len(date) != 3:
        return False
    elif len(date[0]) != 4 or len(date[1]) != 2 or len(date[2]) != 2:
        return False
    elif int(date[1]) < 1 or int(date[1]) > 12:
        return False
    elif int(date[2]) < 1 or int(date[2]) > 31:
        return False
    return True

def getTz():
    dtnow = datetime.now()
    dtutcnow = datetime.utcnow()
    delta = dtnow - dtutcnow
    hh,mm = divmod((delta.days * 24*60*60 + delta.seconds + 30) // 60, 60)

    return "%+02d:%02d" % (hh, mm)

SOURCE_DIR = sys.argv[1]
if len(sys.argv) != 2:
    if sys.argv[2] == 'help' or sys.argv[2] == '--help' or sys.argv[2] == '-h':
        usage()
        exit()

if os.getcwd() != SOURCE_DIR:
    print bcolors.FAIL+'Must be in '+SOURCE_DIR+bcolors.ENDC
    exit(1)

if os.path.isfile(TOKEN_FILE):
    with open(TOKEN_FILE, "rU") as token:
        TOKEN = token.read().strip()
else:
    print bcolors.FAIL+'Please place your GitHub OAuth token in '+TOKEN_FILE+bcolors.ENDC
    exit(1)

CUR_TIME = datetime.now().strftime('T%H:%M:%S')
TZ = getTz()
if len(sys.argv) != 2:
    try:
        if not verifyDateFormat(sys.argv[2]) or not verifyDateFormat(sys.argv[3]):
            print bcolors.FAIL+'Invalid date format!'+bcolors.ENDC
            usage()
            exit(1)
        START_DATE = sys.argv[2]+'T00:00:00'+TZ
        END_DATE = sys.argv[3]+'T00:00:00'+TZ
    except IndexError:
        print bcolors.FAIL+'Insufficient parameters!'+bcolors.ENDC
        usage()
        exit(1)
else:
    tmp = datetime.today().date()-timedelta(1)
    START_DATE = tmp.strftime('%Y-%m-%d')+CUR_TIME+TZ
    END_DATE = datetime.today().date().strftime('%Y-%m-%d')+CUR_TIME+TZ

SINCE = START_DATE.split('T')[0]
UNTIL = END_DATE.split('T')[0]

def parseXML(filename):
    doc = parse(os.path.join(SOURCE_DIR, filename))
    output = doc.getElementsByTagName('project')

    return output

def genURL(project):
    remote = str(project.getAttribute('remote'))
    branch = str(project.getAttribute('revision')).split('/')[-1]
    name = str(project.getAttribute('name')).split('/')
    path = str(project.getAttribute('path'))

    if branch == '':
        branch = DEF_BRANCH

    if remote == 'aosp':
        name = '_'.join(name)
        repo = 'android/'
    elif remote == 'third':
        name = name[-1]
        repo = 'ThirdProject/'
    else:
        name = name[-1]
        repo = 'MoKee/'

    param = {'access_token':TOKEN,'sha':branch,'since':START_DATE,'until':END_DATE}

    return [repo, name, param, path]

def getCommits(info):
    url = 'https://api.github.com/repos/'+info[0]+info[1]+'/commits'
    out = []

    while url:
        response = requests.get(url, params=info[2])

        if response.status_code == 404:
            out = gitLog(info[-1])
            break
        if response.status_code == 403:
            print bcolors.FAIL+'API limit reached!'+bcolors.ENDC
            exit(1)
        elif 'next' in response.links:
            url = response.links['next']['url']
        else:
            url = ''

        for i in response.json():
            out.append(parseJson(i))

    return out

def parseJson(info):
    name = info['commit']['author']['name']
    message = info['commit']['message'].split('\n')[0]

    return (name, message)

def gitLog(path):
    out = []
    gitdir = os.path.join(path,'.git')
    if os.path.isdir(gitdir):
        p = subprocess.check_output(['git','--git-dir='+gitdir,'log','--pretty="%an"','--since='+SINCE,'--until='+UNTIL,'--date-order'])
        if p != '':
            authors = p.strip().split('\n')

            p = subprocess.check_output(['git','--git-dir='+path+'/.git','log','--pretty="%s"','--since='+SINCE,'--until='+UNTIL,'--date-order'])
            commits = p.strip().split('\n')

            i = 0
            for a in authors:
               out.append((a.strip('"'), commits[i].strip('"')))
               i += 1

    return out

def fetch(filename):
    logs={}
    projects = parseXML(filename)
    for project in projects:
        path = str(project.getAttribute('path'))
        print bcolors.OKGREEN+'Getting changelog for '+bcolors.OKBLUE\
            +path+bcolors.ENDC
        commits = getCommits(genURL(project))
        if commits != []:
            logs[path] = commits

    return logs

def outputToFile(filename, commits):
    for project in commits:
        filename.write('Project: '+project+'\n')
        for commit in commits[project]:
            filename.write(commit[0]+' - '+commit[1]+'\n')
        filename.write('\n')

def main():
    LOGS_MAIN = fetch('android/default.xml')
    if os.path.isfile('.repo/local_manifests/roomservice.xml'):
        LOGS_LOCAL = fetch('.repo/local_manifests/roomservice.xml')
    else:
        LOGS_LOCAL = {}
    LOGS = dict(LOGS_MAIN)
    LOGS.update(LOGS_LOCAL)
    LOG_FILE = 'changelog-'+UNTIL+'.log'
    with open(LOG_FILE,'w') as logfile:
        logfile.write('MoKee OpenSource Changelog from %s - %s\n' % (SINCE, UNTIL))
        logfile.write('---------------------------------------------------------------\n\n')
        if LOGS == {}:
            logfile.write('No changes, maybe we delayed commits.\n\n')
        else:
            outputToFile(logfile, LOGS)
        logfile.write('---------------------------------------------------------------\n')
        logfile.write('You can see more changelog from http://changelog.mokeedev.com')

if __name__ == "__main__":
    main()
