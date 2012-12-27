<<<<<<< HEAD
for combo in $(cat vendor/mk/mokee-build-targets)
=======
for combo in $(wget -o /dev/null -O - https://raw.github.com/CyanogenMod/hudson/master/cm-daily-build-targets | grep cm-10.1 | awk {'print $1'})
>>>>>>> ee35e66f6c5cd7251ffb8e2bbc1fedc44f7eb69c
do
    add_lunch_combo $combo
done
