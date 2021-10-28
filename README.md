# GitHub Action to Test Airflow Dags 🧪

Validate and test DAGs, before deploying to production by creating an isolated Airflow on Docker Container with supplied variables and dependencies.

Currently supporting only Airflow v2.0.2.

![Main CI/CD Pipeline](https://github.com/micael-grilo/airflow-dags-test-action/workflows/Main%20CI/CD%20Pipeline/badge.svg)

## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

#### The following example includes optimal defaults for a standard airflow test solution:

- 'requirements-file': And path to your requirements file `requirements.txt`.
- 'dags-path': And path to your DAGs directory
- 'dags-test-folder': And path to your tests directory
- 'var-file': And path to your `var.json` to set your airflow variables, by default uses GitHub secrets.

```yml
- name: 'Test Airflow DAGs'
  uses: micael-grilo/airflow-dags-test-action@master
    with:
      requirements-file: project/requirements.txt
      dags-path: project/dags
      dags-test-folder: project/tests
      var-file: project/var.json
```

## Contributions
Inspired by [jayamanikharyono](https://github.com/jayamanikharyono/airflow-dag-action) airflow-dag-action.

Contributions are very welcome. You can follow this standard [contributions guidelines](https://github.com/firstcontributions/first-contributions) to contribute code.


## License

This project is distributed under the [MIT license](LICENSE.md).