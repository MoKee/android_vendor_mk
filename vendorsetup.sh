for combo in $(curl -s https://raw.githubusercontent.com/MoKee/android_external_mokee_BuildController/mkl-mr1/mk_build_targets | sed -e 's/#.*$//' | awk {'print $1'})
do
    add_lunch_combo $combo
done
