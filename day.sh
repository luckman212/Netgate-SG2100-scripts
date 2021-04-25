#!/bin/sh
/root/night
sysctl -q dev.gpio.2.led.2.pwm=1
gpioctl -f /dev/gpioc2 7 duty 1 >/dev/null
