docker run -d=true  -p=8888:8888 -v=%CD%/notebooks:/notebooks -v=%CD%/data:/data -v=%CD%/config:/config --name spydock-notebook spikewilliams/spydock 
