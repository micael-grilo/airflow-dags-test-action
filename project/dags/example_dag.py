from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.models import Variable
from airflow.utils.dates import days_ago

from datetime import datetime, timedelta


DAG_ID = "dag_id"

default_args = {
    "owner": "MG",
    "depends_on_past": False,
    "start_date": datetime.now().date(),
    "email": ["example@123.com"],
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 0,
    "retry_delay": timedelta(minutes=5),
}


def import_module():
    return True


def access_var():
    my_var = Variable.get("EXAMPLE_VAR")
    print(f"My Airflow var : {my_var}")
    return my_var


with DAG(
    DAG_ID,
    description="sample dag to test dag",
    default_args=default_args,
    access_control={
        "MG": {"can_read", "can_edit"}, 
        "BI": {"can_read"}
    },
    schedule=timedelta(days=1),
) as dag:

    import_module = PythonOperator(
        task_id="import_module", python_callable=import_module, dag=dag
    )

    access_var = PythonOperator(
        task_id="access_var", python_callable=access_var, dag=dag
    )

    import_module >> access_var
