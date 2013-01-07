#!/bin/sh

rebuild_path() {
  vendor=$1
  repo=$2

  pth=".$vendor.$repo.pth.part"
  echo "# $vendor/$repo " > $pth
  for path in `cat $vendor/$repo/*.pth` ; do
    case "$path" in
      !*) echo "!$vendor/$repo/${path#'!'}" >> $pth ;;
      *) echo "$vendor/$repo/$path" >> $pth ;;
    esac
  done
}

rebuild_paths() {
  cat .*.pth.part > use.pth 2>/dev/null
}