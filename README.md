# GitHub Action to Test Airflow Dags 🧪

Validate and test DAGs, before deploying to production by creating an isolated Airflow on Docker Container with supplied variables and dependencies.

Currently supports Airflow [v2.0.2](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.0.2), [v2.2.2](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.2.2), [v2.4.3](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.4.3), [v2.5.1](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.5.1),  [v2.6.3](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.6.3), [v2.7.2](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.7.2), [v2.8.1](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.8.1), [v2.9.2](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.9.2), [v2.10.1](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.10.1) and [v2.10.3](https://github.com/micael-grilo/airflow-dags-test-action/releases/tag/v2.10.3).


![Main CI/CD Pipeline](https://github.com/micael-grilo/airflow-dags-test-action/workflows/Main%20CI/CD%20Pipeline/badge.svg)

## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

#### The following example includes optimal defaults for a standard airflow test solution:

- 'requirements-file': Path to your requirements file `requirements.txt`.
- 'dags-path': Path to your DAGs directory
- 'dags-test-folder': Path to your tests directory
- 'var-file': Path to your `var.json` to set your airflow variables, by default uses GitHub secrets.
- 'error-comment': Boolean flag for whether to output the error message as a comment on the PR. Default is `False`. 

```yml
- name: 'Test Airflow DAGs'
  uses: micael-grilo/airflow-dags-test-action@v2.10.3
    with:
      requirements-file: project/requirements.txt
      dags-path: project/dags
      dags-test-folder: project/tests
      var-file: project/var.json
      error-comment: True
      access-token: ${{ secrets.GITHUB_TOKEN }}
```

## Contributions
Inspired by [jayamanikharyono](https://github.com/jayamanikharyono/airflow-dag-action) airflow-dag-action.

Contributions are very welcome. You can follow this standard [contributions guidelines](https://github.com/firstcontributions/first-contributions) to contribute code.


## License

This project is distributed under the [MIT license](LICENSE.md).
