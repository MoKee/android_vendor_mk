for combo in $(curl -s https://raw.githubusercontent.com/MoKee/android_external_mokee_BuildController/mkp/mk_build_targets | sed -e 's/#.*$//' | awk '{printf "mk_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done

add_lunch_combo mokee_arm-userdebug
add_lunch_combo mokee_arm64-userdebug
add_lunch_combo mokee_x86-userdebug
add_lunch_combo mokee_x86_64-userdebug
