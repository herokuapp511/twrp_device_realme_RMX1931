#!/system/bin/sh

load_RMX1931L1()
{
    resetprop "ro.product.device" "RMX1931L1"
    resetprop "ro.commonsoft.ota" "RMX1931L1"
    resetprop "ro.separate.soft" "19688"
    echo "Global variant detected"
}

load_RMX1931CN()
{
    resetprop "ro.product.device" "RMX1931CN"
    resetprop "ro.commonsoft.ota" "RMX1931"
    resetprop "ro.separate.soft" "19781"
    echo "Chinese variant detected"
}

project=$(cat /proc/oplusVersion/operatorName)
echo $project

case $project in
    "5") load_RMX1931L1 ;;
    "8") load_RMX1931CN ;;
esac

resetprop "ro.build.date.utc" "1000000000"
resetprop "ro.system.build.date.utc" "0000000000"
resetprop "ro.system_ext.build.date.utc" "0000000000"
resetprop "ro.vendor.build.date.utc" "0000000000"
resetprop "ro.odm.build.date.utc" "0000000000"
resetprop "ro.product.build.date.utc" "0000000000"

# Wait for AW8697 haptic driver to complete firmware load (ram_init=1) and set gentle gain
echo "variant-script: waiting for AW8697 haptic firmware ready..." > /dev/kmsg
count=0
while [ $count -lt 30 ]; do
    if [ -e /sys/class/leds/vibrator/gain ]; then
        echo 0x30 > /sys/class/leds/vibrator/gain 2>/dev/null
        curr_gain=$(cat /sys/class/leds/vibrator/gain 2>/dev/null)
        if [ "$curr_gain" = "0x30" ]; then
            echo 0x12 > /sys/class/leds/vibrator/vmax 2>/dev/null
            echo "variant-script: AW8697 gentle haptic gain applied successfully (gain=$curr_gain)" > /dev/kmsg
            break
        fi
    fi
    count=$((count + 1))
    sleep 0.25
done

exit 0
