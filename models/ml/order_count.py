import bigframes.pandas as bpd

def model(dbt, session):
    # Minimal config to ensure no extra overhead
    dbt.config(
        materialized="table",
        submission_method="bigframes",
       
    )

    # Force the engine to recognize your setup
    bpd.options.bigquery.project = "my-1-st-project-training"
    bpd.options.bigquery.location = "US" 

    # Create a tiny test table
    df = bpd.DataFrame({"test_col": [1, 2, 3]})
    
    return df

# import sys
# import os

# sys.path.append(os.getcwd())

# from modules.malloy_helper import run_malloy

# def model(dbt, session):
#     dbt.config(materialized="table")
    
#     bdf = run_malloy("models/malloy/order_view.malloy", "orders_by_location")

#     return bdf