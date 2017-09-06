FROM python:3

RUN mkdir /salicweb
ENV DBNAME pes
ENV DBHOST db
ENV DBPASSWORD rt
ENV DBPORT 5444442
ENV DBUSER potgr
WORKDIR /salicweb/

ADD requirements.txt /salicweb/

RUN pip install --trusted-host pypi.python.org -r requirements.txt

ADD . /salicweb/

RUN python3 salicweb/settings.py DBNAME DBUSER DBPASSWORD DBHOST DBPORT 
CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
