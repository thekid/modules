#!/bin/sh
#-modules add <vendor>/<repo> [version]: Adds a module (default: master)

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

if [ -d $dir ] ; then
  echo "===> Module $dir already exists, selecting..."
else

  # Clone development checkouts from GH, otherwise use tar.gz downloads
  echo "===> Checkout $dir"
  mkdir -p $dir
  cd $dir

  if [ ":dev" = "$version" ] ; then
    git clone git@github.com:$vendor/$repo.git . || exit 2
  else
    curl -L https://github.com/$vendor/$repo/archive/$version.tar.gz -o - | tar xvz --strip-components=1
  fi

  cd ../..
fi

# Rebuild
$(rebuild_path $vendor $repo $dir)
$(rebuild_paths)
echo "===> Done"