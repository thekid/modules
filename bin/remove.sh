#!/bin/sh
#-modules remove <vendor>/<repo> [version]: Removes a module

arg=${1%*/}
shift 1 || exit 2

vendor=${arg%/*}
repo=${arg#*/}

case "$1" in
  "")   version=master; dir=$vendor/$repo@master ;;
  :dev) version=:dev; dir=$vendor/$repo ;;
  :*)   echo "*** Illegal version selector $1" && exit 3 ;;
  *)    version=r$1; dir=$vendor/$repo@$1 ;;
esac

if [ ! -e "$dir" ] ; then
  echo "*** No such module $dir"
  exit 1
fi

# Remove checkout
rm -rf "$dir" "$pth"

# Check if selected
pth="."`echo $dir | sed -e s#/#.#g`".pth.part"
if [ -e $pth ] ; then
  rm -f $pth
  selected=$(ls -1d $vendor/$repo* | head -1)
  echo "---> Module $dir was active, selecting $selected"
  $(rebuild_path $vendor $repo $selected)
fi

# Rebuild paths
$(rebuild_paths)

echo "===> Module $vendor/$repo removed"