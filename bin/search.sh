#!/bin/sh
#-modules search <vendor>

vendor=${1%*/}
shift 1 || exit 2

curl -s -XGET https://api.github.com/users/$vendor/repos?type=public | grep full_name | cut -d '"' -f 4