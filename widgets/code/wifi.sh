#!/bin/bash

# echo -n "@$(basename "$0" | sed -E 's/.{3}$//')@ "
echo -n '@wifi@ '

myvar1=`netstat -ibn | grep -e "en0" -m 1 | awk '{print $7}'` #  bytes in
myvar3=`netstat -ibn | grep -e "en0" -m 1 | awk '{print $10}'` # bytes out

#wait one second
sleep 1

myvar2=`netstat -ibn | grep -e "en0" -m 1 | awk '{print $7}'` # bytes in again
myvar4=`netstat -ibn | grep -e "en0" -m 1 | awk '{print $10}'` # bytes out again

# ETHERNET: find the difference between bytes in and out during that one second
subin=$(($myvar2 - $myvar1))
subout=$(($myvar4 - $myvar3))

# ETHERNET: convert bytes to kilobytes
kbin=`echo "scale=3; $subin/1024/125;" | bc`
kbout=`echo "scale=3; $subout/1024/125;" | bc`

INFO="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo)"

if [[ "$INFO" == 'AirPort: Off' ]]; then
    echo "OFF"
elif [[ "$(echo "$INFO" | awk '/state:/ {print $2}')" == 'init' ]]; then
    echo "NONE"
else
    DBM=$(echo "$INFO" | awk '/agrCtlRSSI/ {print $NF}')
    if [[ "$DBM" -le -100 ]]; then
        QUALITY=0
    elif [[ "$DBM" -ge -50 ]]; then
        QUALITY=100
    else
        QUALITY=$(echo "2 * ($DBM + 100)" | bc -l)
    fi
    SSID=$(echo "$INFO" | awk '/[^B]SSID/ {print $NF}')
    IP=$(ifconfig en0 inet | awk '/inet/ {print $2}')
    echo "$kbin down $kbout up"
    echo "$IP $SSID ${QUALITY}%"
fi


