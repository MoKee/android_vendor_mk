for combo in $(curl -s https://raw.githubusercontent.com/MoKee/android_external_mokee_BuildController/mko/mk_build_targets | sed -e 's/#.*$//' | awk '{printf "mk_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
