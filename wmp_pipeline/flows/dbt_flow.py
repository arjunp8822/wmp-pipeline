from prefect import flow, task
import subprocess

@task
def run_dbt_command(command: str):
    """
    Runs a dbt command using subprocess.
    """
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        raise Exception(f"DBT command failed: {result.stderr}")
    print(result.stdout)
    return result.stdout

@flow
def dbt_flow():
    """
    A flow that runs a series of dbt commands.
    """
    run_dbt_command("dbt run")
    run_dbt_command("dbt test")

if __name__ == "__main__":
    dbt_flow()