FROM python:3

RUN mkdir /salicweb
WORKDIR /salicweb/

ADD requirements.txt /salicweb/

#Install depedencies for pyodbc
RUN apt-get update && apt-get install -y unixodbc unixodbc-dev unixodbc-bin

RUN pip install --trusted-host pypi.python.org -r requirements.txt

ADD . /salicweb/



