FROM python:3.11

RUN apt-get update
RUN apt install -y xmlsec1 libxml2 libxmlsec1 libxmlsec1-dev

RUN pip install --upgrade pip
RUN pip install pytest==9.1.1
RUN pip install apache-airflow==3.3.1
RUN pip install pygithub==2.9.1

RUN mkdir /action
COPY comment.py /action/comment.py

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db migrate > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
