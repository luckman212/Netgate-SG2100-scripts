#!/bin/sh
l=0
while [ $l -le 8 ]; do
  gpioctl -f /dev/gpioc2 $l duty 0 >/dev/null
  l=$(( l + 1 ))
done
