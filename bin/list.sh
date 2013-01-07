#!/bin/sh
#-modules list: Shows a list of all installed modules

i=0
for module in `ls -d */* | grep -v ^bin`; do
  pth="."`echo $module | sed -e s#/#.#g`".pth.part"
  if [ -e "$pth" ] ; then
    echo "A $module"
  else
    echo "- $module"
  fi
  i=$(expr $i + 1)
done
echo "===> $i module(s) installed"