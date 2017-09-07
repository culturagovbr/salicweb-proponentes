FROM python:3

ENV DBNAME postgres
ENV DBHOST localhost 
ENV DBPASSWORD root
ENV DBPORT 5432
ENV DBUSER postgres 

RUN mkdir /salicweb
WORKDIR /salicweb/

EXPOSE 8000

ADD requirements.txt /salicweb/

RUN pip install --trusted-host pypi.python.org -r requirements.txt

ADD . /salicweb/

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
