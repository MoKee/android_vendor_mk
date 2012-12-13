if [ -e vendor/mokee/mokee-build-targets ]; then
for combo in $(cat vendor/mokee/mokee-build-targets)
do
    add_lunch_combo $combo
done
fi

