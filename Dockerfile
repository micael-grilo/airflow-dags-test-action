FROM python:3.7

RUN pip install apache-airflow==2.0.2 wtforms==2.3.3
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db init > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
