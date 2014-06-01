#!/bin/sh
sudo docker run -d=true  -p=8888:8888 -v=`pwd`/notebooks:/notebooks -v=`pwd`/data:/data -v=`pwd`/config:/config spydock/base 
