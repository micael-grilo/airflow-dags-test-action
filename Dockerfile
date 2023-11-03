FROM python:3.10

RUN pip install apache-airflow==2.6.3
RUN pip install connexion==2.14.2
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db init > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
