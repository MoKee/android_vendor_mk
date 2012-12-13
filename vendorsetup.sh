if [ -e vendor/mk/mokee-build-targets ]; then
for combo in $(cat vendor/mk/mokee-build-targets)
do
    add_lunch_combo $combo
done
fi

