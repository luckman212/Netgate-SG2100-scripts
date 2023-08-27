
Devive online version one led based

#!/bin/sh
pfctl -vvss | grep ', rule 79' >/dev/null
res=$?
if [ $res = 0 ]; then
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 1 >/dev/null
fi


Device online version one led based will have green status 
and Red will turn on when device with rule 79 goes online

#!/bin/sh
pfctl -vvss | grep ', rule 79' >/dev/null
res=$?
if [ $res = 0 ]; 
then
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 7 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 7 >/dev/null
else
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 7 duty 7 >/dev/null
fi

Device online 3 led version all LEDs will light red when device is online and 
go dark when device is offline

#!/bin/sh
pfctl -vvss | grep ', rule 79' >/dev/null
res=$?
if [ $res = 0 ]; 
then
  sysctl -q dev.gpio.2.led.0.pwm=1
  gpioctl -f /dev/gpioc2 0 duty 200 >/dev/null
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 200 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 200 >/dev/null
else
  sysctl -q dev.gpio.2.led.0.pwm=1
  gpioctl -f /dev/gpioc2 0 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 1 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 2 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 4 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 5 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 7 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 8 duty 0 >/dev/null
fi

Version with purple LED setting multiple colors on for same led

#!/bin/sh
pfctl -vvss | grep ', rule 79' >/dev/null
res=$?
if [ $res = 0 ]; 
then
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 100 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 7 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 6 duty 100 >/dev/null
  gpioctl -f /dev/gpioc2 8 duty 100 >/dev/null
else
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 8 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 7 duty 7 >/dev/null
fi



version with full variable to iterate over for multiple items variable is named state

#!/bin/sh
state=$( pfctl -vvss )
res=1
resb=1
case "$state" in 
  *, rule 79*)
    res=0
    ;;
esac
case "$state" in 
  *192.168.1.11*)
    resb=0
    ;;
esac
if [ $res = 0 ] && [ $resb = 0 ]; 
then
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 50 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 7 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 6 duty 50 >/dev/null
elif [ $res = 0 ];
then
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 7 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 6 duty 50 >/dev/null
elif [ $resb = 0 ];
then
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 7 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 6 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 50 >/dev/null
else
  sysctl -q dev.gpio.2.led.1.pwm=1
  gpioctl -f /dev/gpioc2 3 duty 0 >/dev/null
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 0 >/dev/null
  gpioctl -f /dev/gpioc2 7 duty 50 >/dev/null
  
fi


