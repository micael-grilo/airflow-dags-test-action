FROM python:3.11

RUN pip install apache-airflow==2.8.1
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db migrate > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
