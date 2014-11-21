SpyDock
=======

Release 2014.11 (Carbon) contains the following packages:

- Python: 3.4.2 
- IPython: 2.3.0 
- Pandas: 0.15.0 
- Numpy: 1.9.1 
- SciPy: 0.14.0 
- MatPlotLib: 1.4.2 
- BeautifulSoup: 4.3.2

Currently, usage of SpyDock is limited to running scripts inside the web-based “IPython Notebook” IDE, which is built in to the container. This environment is well-suited for the development and execution of web-scraping and data processing scripts.

To run this environment on port 8888, use the following docker command:

    docker run -d=true -p=8888:8888 spikewilliams/spydock

Next point your browser to port 8888 on your server, and you will be able to interact with the IPython Notebook IDE. If you want to know more about how to use IPython Notebook, [here are some tutorials.][1] to get you started. Also, please ensure that you are safely behind a firewall and that port 8888 is not unduly exposed to people who may wish your computer harm.

SpyDock containers have several volumes that can be mounted to local directories. These include:

- /notebooks - This is where scripts created in IPython Notebook are hosted
- /data - You can stick files in here that can be accessed by scripts that look under this path
- /output - You can have your scripts write their output to files under here, to make it available to the host system
- /var/logs - Mount this if you wish to view the logs from IPython and other container functions
- /test - Output from unit tests goes here

Thus, if you wish to run SpyDock with the notebook scripts going into a folder in the current directory called "myscripts", and the output going to /tmp, do the following:

    docker run -d=true -p=8888:8888 -v=`pwd`/myscripts:/notebooks -v=/tmp:/output spikewilliams/spydock



  [1]: http://nbviewer.ipython.org/github/ipython/ipython/blob/master/examples/Notebook/Index.ipynb
