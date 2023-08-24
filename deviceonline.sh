#!/bin/sh
pfctl -vvss | grep ', rule 79' >/dev/null
res=$?
if [ $res = 0 ]; then
  sysctl -q dev.gpio.2.led.2.pwm=1
  gpioctl -f /dev/gpioc2 6 duty 1 >/dev/null
fi
