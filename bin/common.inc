#!/bin/sh

rebuild_path() {
  vendor=$1
  repo=$2
  dir=$3

  # Deselect any previously selected
  rm -f .$vendor.$repo*.pth.part

  # Select this
  pth="."`echo $dir | sed -e s#/#.#g`".pth.part"
  echo "# $dir " > $pth
  for path in `cat $dir/*.pth` ; do
    case "$path" in
      !*) echo "!$dir/${path#'!'}" >> $pth ;;
      *) echo "$dir/$path" >> $pth ;;
    esac
  done
  echo >> $pth
}

rebuild_paths() {
  cat .*.pth.part > use.pth 2>/dev/null
}