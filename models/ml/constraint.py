import bigframes.pandas as bpd

def model(dbt, session):
    dbt.config(materialized="table")
    
    # Simple one-row dataframe
    data = {'constraint': [1000]}
    df = bpd.DataFrame(data)
    
    return df