#!/bin/sh

if [ "$1" = "" ] ; then
  echo "Usage: add [vendor]/[module]"
  exit 1
fi

vendor=${1%/*}
repo=${1#*/}

if [ -d "$vendor/$repo" ] ; then
  echo "*** Module $vendor/$repo already exists"
else

  # Clone from GH
  echo "===> Checkout $vendor/$repo"
  mkdir -p $vendor
  cd $vendor
  git clone git@github.com:$vendor/$repo.git || exit 2

  # Add to path
  cd ..
  $(rebuild_path "$vendor" "$repo")
fi

# Rebuild paths
$(rebuild_paths)