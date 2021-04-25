## LED Control Scripts for Netgate SG-2100

### About

Inspired by [this thread](https://www.reddit.com/r/Netgate/comments/mxjawo/sg2100_led_light_too_bright/) on r/Netgate, these are some simple control scripts to turn LEDs on/off to increase [WAF](https://en.wikipedia.org/wiki/Wife_acceptance_factor). Adjust as desired, the `day` script below will apply a dim green color to the leftmost LED. You can play with the brightness by adjusting `duty` (0-255) and RGB values by replicating the `gpioctl` command for `/dev/gpioc2` 6,7,8 (R,G,B).

### Setup

1. ssh / console to your SG-2100
1. choose option `8` (shell)
1. `cat >/root/night`
1. paste the text below:
   ```
   #!/bin/sh
   l=0
   while [ $l -le 8 ]; do
     gpioctl -f /dev/gpioc2 $l duty 0 >/dev/null
     l=$(( l + 1 ))
   done
   ```
1. press <kbd>⌃CTRL</kbd>+<kbd>D</kbd>
1. `cat >/root/day`
1. paste the text below:
   ```
   #!/bin/sh
   /root/night
   sysctl -q dev.gpio.2.led.2.pwm=1
   gpioctl -f /dev/gpioc2 7 duty 1 >/dev/null
   ```
1. `chmod +x /root/day /root/night`
1. Schedule with `Cron` package for whatever times desired.
