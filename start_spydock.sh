#!/bin/sh
export PASS=$1
if [ "${PASS}" = "" ]; then
  echo Usage: sh start_spydock.sh [notebook_password]
else
  docker run -it -d=true  -p=8887:8888 -v=`pwd`/notebooks:/notebooks:Z -v=`pwd`/data:/data:Z -v=`pwd`/config:/config:Z -e PASSWORD=${PASS} spikewilliams/spydock
fi
