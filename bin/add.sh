#!/bin/sh
#-modules add <vendor>/<repo>: Adds a module

arg=${1%*/}
shift 1 || exit 2

vendor=${arg%/*}
repo=${arg#*/}

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