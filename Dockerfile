FROM python:3.11

RUN pip install apache-airflow==2.7.2
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db init > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
