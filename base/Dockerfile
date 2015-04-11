FROM debian:jessie
MAINTAINER Bobby Williams spikewilliams@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential \
	libssl-dev \
	openssl \
	libsqlite3-0 \
	libsqlite3-dev \
	wget \
	libncurses5 \
	libncurses5-dev \
	libbz2-1.0 \
	libbz2-dev 
RUN apt-get install -y gfortran \
	libopenblas-base \
	libopenblas-dev \
	liblapack3 \
	liblapack-dev \
	libfreetype6 \
	libfreetype6-dev \
	libxml2 \
	libxml2-dev \
	libxslt1.1 \
	libxslt1-dev \
	octave

RUN wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz \  
	&& tar -xf Python-*.tgz \
	&& cd Python-* && ./configure  --with-ensurepip=install && make && make install && cd .. \
	&& rm -rf Python-3*

RUN pip3 install readline nose pyzmq tornado jinja2 jsonschema sphinx Cython  numpy pytz lxml html5lib beautifulsoup4 \
	 python-dateutil oct2py pymongo requests ipython numpy_display 
	
# This is to get a version of xlwt that works with Python 3
RUN apt-get -y install unzip && \
	wget https://github.com/takluyver/xlwt/archive/py3.zip \
	&& unzip py3.zip \
	&& cd xlwt-py3 && python3 setup.py install && cd .. \
	&& rm -rf xlwt-py3 && rm -f xlwt-py3

RUN pip3 install pymysql xlrd  
#TODO: find version of xlutils that will work with xlwt/python 3.x 
RUN pip3 install numexpr bottleneck xlsxwriter openpyxl SQLAlchemy bokeh

#RUN wget https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-0.9.6.tar.gz \
#	&& tar -xf SQLAlchemy*.tar.gz \
#	&& cd SQLAlchemy* && python3 setup.py install && cd .. \
#	&& rm -rf SQLAlchemy*

RUN wget https://github.com/pydata/pandas/archive/v0.16.0.tar.gz \ 
	&& tar -xf v0.16.0.tar.gz \
	&& cd pandas-* && python3 setup.py install && cd .. \
	&& rm -rf pandas-* && rm v0*tar.gz

RUN wget http://downloads.sourceforge.net/project/scipy/scipy/0.15.0/scipy-0.15.0.tar.gz \
	&& tar -xf scipy-*.tar.gz \
	&& cd scipy-* && python3 setup.py install && cd .. \
	&& rm -rf scipy-*

# matlibplot and its dependencies
RUN wget https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.4.3/matplotlib-1.4.3.tar.gz \
	&& tar -xf matplotlib-1.4.3.tar.gz \
	&& ln -s /usr/include/freetype2/*  matplotlib-1.4.3 \
	&& cd matplotlib-1.4.3 && python3 setup.py install && cd .. \
	&& rm -rf matplotlib-*

VOLUME ["/notebooks","/config","/data","/output","/var/log","/tests"]

RUN apt-get remove -y --purge libsqlite3-dev libssl-dev wget  gfortran libncurses5-dev libbz2-dev \
	libopenblas-dev liblapack-dev  libfreetype6-dev libxml2-dev libxslt-dev \
  	&& apt-get -y autoremove && apt-get -y clean 

ADD scripts/run_unit_tests /run_unit_tests
ADD scripts/start_notebook /start_notebook
RUN chmod a+x /start_notebook
RUN chmod a+x /run_unit_tests

EXPOSE 8888
CMD /start_notebook
