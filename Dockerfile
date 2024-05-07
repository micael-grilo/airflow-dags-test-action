FROM python:3.11

RUN pip install 'pendulum<3.0.0'
RUN pip install Flask-Session==0.5.0
RUN pip install apache-airflow==2.8.1
RUN pip install connexion==2.14.2
RUN pip install xmlsec==1.3.14
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN airflow db migrate > /dev/null

ENTRYPOINT ["/entrypoint.sh"]
