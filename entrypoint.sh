#!/bin/sh

export AIRFLOW_HOME="/github/workspace/$2"
export PYTHONPATH="${PYTHONPATH}:${AIRFLOW_HOME}"

echo "Start Testing"
echo "Requirements path : $1"
echo "DAGs dir : $2"
echo "Tests dir : /github/workspace/$3"
echo "Airflow Home : $AIRFLOW_HOME"
echo "Python : $PYTHONPATH"

if [ ! -z "$SECRETS_CONTEXT" ]; then
    AIRFLOWVARPATH="$AIRFLOW_HOME/var.json"
    echo $SECRETS_CONTEXT > $AIRFLOWVARPATH
    echo "Saved Airflow Variables from Github secrets! $AIRFLOWVARPATH"
else
    AIRFLOWVARPATH=$4
    echo "Loaded Airflow Variables from file: $AIRFLOWVARPATH!"
fi

pip install -r $1

airflow db upgrade > /dev/null

airflow variables import $AIRFLOWVARPATH

pytest "/github/workspace/$3"
