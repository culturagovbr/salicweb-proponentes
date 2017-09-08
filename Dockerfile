FROM python:3

RUN mkdir /salicweb
WORKDIR /salicweb/

ENV DBHOST = localhost
ENV DBPORT = 5432
ENV DBPASS = root 
ENV DBNAME = postgres
ENV DBUSER = postgres

EXPOSE 8000

ADD requirements.txt /salicweb/

RUN apt-get update && apt-get install -y unixodbc unixodbc-dev unixodbc-bin
RUN pip install --trusted-host pypi.python.org -r requirements.txt

ADD . /salicweb/

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]


