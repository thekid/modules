#!/bin/sh

update_module() {
  vendor=$1
  repo=$2

  cd "$vendor/$repo"
  git pull 1>&2 || exit 2

  cd ../..
  $(rebuild_path "$vendor" "$repo")
  exit 0
}

if [ "$1" = "" ] ; then
  s=0
  e=0
  for module in `ls -d */* | grep -v ^bin`; do
    echo "===> Updating $module"
    $(update_module ${module%/*} ${module#*/})

    if [ $? = 0 ] ; then s=$(expr $s + 1) ; else e=$(expr $e + 1) ; fi
  done

  echo "===> Done, $s module(s) updated, $e error(s)"
else
  arg=${1%*/}

  if [ ! -e "$arg/.git" ] ; then
    echo "*** No such module $arg"
    exit 1
  fi

  echo "===> Updating $arg"
  $(update_module ${arg%/*} ${arg#*/})
fi

# Rebuild paths
$(rebuild_paths)
