FROM python:3

RUN mkdir /salicweb
WORKDIR /salicweb/

EXPOSE 8000

ADD requirements.txt /salicweb/

RUN apt-get update && apt-get install -y unixodbc unixodbc-dev unixodbc-bin
RUN pip install --trusted-host pypi.python.org -r requirements.txt

#COPY ./docker-entrypoint.sh /usr/local/bin/
#ENTRYPOINT ["docker-entrypoint.sh"]

ADD . /salicweb/

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]