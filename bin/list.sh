#!/bin/sh
#-modules list: Shows a list of all installed modules

i=0
for module in `ls -d */* | grep -v ^bin`; do
  echo $module
  i=$(expr $i + 1)
done
echo "===> $i module(s) installed"