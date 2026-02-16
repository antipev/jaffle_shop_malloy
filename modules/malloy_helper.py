import malloy
import asyncio
from malloy.data.bigquery import BigQueryConnection

async def _run_malloy(file_path, query_name):
    runtime = malloy.Runtime()
    runtime.add_connection(BigQueryConnection("bigquery"))
    
    try:
        model_resource = runtime.load_file(file_path)
        query_result = await model_resource.run(named_query=query_name)
        return query_result.to_dataframe() if query_result else None
    finally:
        runtime.close()

def run_malloy(file_path, query_name):
    return asyncio.run(_run_malloy(file_path, query_name))