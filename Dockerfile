FROM python:3.11

RUN apt-get update
RUN apt install -y xmlsec1 libxml2 libxmlsec1 libxmlsec1-dev

RUN pip install --upgrade pip
RUN pip install pytest==8.3.3
RUN pip install apache-airflow==2.10.3
RUN pip install pygithub==2.4.0

RUN mkdir /action
COPY comment.py /action/comment.py

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db migrate > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
