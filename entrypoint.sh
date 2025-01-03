#!/bin/sh

export AIRFLOW_HOME="/github/workspace/$2"
export PYTHONPATH="${PYTHONPATH}:${AIRFLOW_HOME}"

echo "Start Testing"
echo "Requirements path : $1"
echo "DAGs dir : $2"
echo "Tests dir : /github/workspace/$3"
echo "Comment on Error : $5"
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

cp -r /action/* /github/workspace/
pytest "/github/workspace/$3" -s -q >> result.log

pytest_exit_code=`echo Pytest exited $?`
echo $pytest_exit_code

if [ "$5" = "True" ] && [ "$pytest_exit_code" != "Pytest exited 0" ]; then
    echo "Pytest did not exit. Sending output to PR"
    python comment.py --log_filename=result.log --repo_token=$6 
fi
if [ "$pytest_exit_code" != "Pytest exited 0" ]; then exit 1 ;fi