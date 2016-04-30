SpyDock
=======

Release 2016.04 contains the following packages:

- Python: 3.5.1 
- IPython: 4.2.0
- Jupyter: 1.0.0 
- Pandas: 0.18.0
- GDAL: 2.0.1 


SpyDock is accessed via a web service, in which scripts are run inside the web-based "Jupyter Notebook” IDE, which is built in to the container. This environment is well-suited for the development and execution of web-scraping and data processing scripts, as well as for GIS functionality through use of the GDAL library. Spydock now also includes libhxl, for use in working with data files stored using [Humanitarian Exchange Language][2] tags.

Spydock may be built in a docker supporting linux environment using the build.sh or cleanbuild.sh scripts. It may also be pulled from Docker Hub using:

    docker pull spikewilliams/spydock

To run this environment on port 8888, use the following docker command:

    docker run -d=true -p=8888:8888 spikewilliams/spydock

Next point your browser to port 8888 on your server, and you will be able to interact with the Jupyter Notebook IDE. If you want to know more about how to use Jupyter Notebook, [here are some tutorials.][1] to get you started. Also, please ensure that you are safely behind a firewall and that port 8888 is not unduly exposed to people who may wish your computer harm.

SpyDock containers have several volumes that can be mounted to local directories. These include:

- /notebooks - This is where scripts created in IPython Notebook are hosted
- /data - You can stick files in here that can be accessed by scripts that look under this path
- /output - You can have your scripts write their output to files under here, to make it available to the host system
- /var/logs - Mount this if you wish to view the logs from IPython and other container functions
- /test - Output from unit tests goes here

Thus, if you wish to run SpyDock with the notebook scripts going into a folder in the current directory called "myscripts", and the output going to /tmp, do the following:

    docker run -d=true -p=8888:8888 -v=`pwd`/myscripts:/notebooks -v=/tmp:/output spikewilliams/spydock



  [1]: http://nbviewer.ipython.org/github/ipython/ipython/blob/master/examples/Notebook/Index.ipynb
  [2]: http://hxlstandard.org
