#!/bin/sh

if [ "$1" = "" ] ; then
  echo "Usage: remove [vendor]/[module]"
  exit 1
fi

arg=${1%*/}
vendor=${arg%/*}
repo=${arg#*/}

if [ ! -e "$vendor/$repo/.git" ] ; then
  echo "*** No such module $vendor/$repo"
  exit 1
fi

rm -rf "$vendor/$repo" ".$vendor.$repo.pth.part"

# Remove vendor directory
ls "$vendor/*" 2>/dev/null || rmdir "$vendor" 

# Rebuild paths
$(rebuild_paths)

echo "===> Module $vendor/$repo removed"