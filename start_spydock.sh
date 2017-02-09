#!/bin/sh
sudo docker run -it -d=true  -p=8888:8888 -v=`pwd`/notebooks:/notebooks -v=`pwd`/data:/data -v=`pwd`/config:/config spikewilliams/spydock 
