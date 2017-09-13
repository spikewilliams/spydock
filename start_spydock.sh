#!/bin/sh
export PASS=$1
if [ "${PASS}" = "" ]; then
  echo Usage: sh start_spydock.sh [notebook_password]
else
  docker run -it -d=true  -p=8888:8888 -v=`pwd`/notebooks:/notebooks -v=`pwd`/data:/data -v=`pwd`/config:/config -e PASSWORD=${PASS} spikewilliams/spydock
fi
