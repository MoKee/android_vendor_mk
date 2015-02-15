for combo in $(curl -s https://raw.githubusercontent.com/MoKee/android_external_mokee_BuildController/mkl/mk_build_targets | sed -e 's/#.*$//' | awk {'print $1'})
do
    add_lunch_combo $combo
done
add_lunch_combo mk_l01f-userdebug
add_lunch_combo mk_i9100-userdebug
