{% macro create_table_with_metadata() -%}
  {% set sql %}
    CREATE OR REPLACE PROCEDURE `my-1-st-project-training.dbt_maksim_ml.create_table_with_metadata`(
        target_table_id STRING,
        query_string STRING,
        table_desc STRING,
        column_metadata ARRAY<STRUCT<name STRING, description STRING>>
    )
    BEGIN
      -- Change %t to %T here to fix the quoting error
      EXECUTE IMMEDIATE FORMAT("CREATE OR REPLACE TABLE `%s` OPTIONS(description=%T) AS %s",
                               target_table_id, table_desc, query_string);

      FOR meta IN (SELECT * FROM UNNEST(column_metadata)) DO
        -- Change %t to %T here as well
        EXECUTE IMMEDIATE FORMAT("ALTER TABLE `%s` ALTER COLUMN `%s` SET OPTIONS(description=%T)",
                                 target_table_id, meta.name, meta.description);
      END FOR;
    END;
  {% endset %}

  {% do run_query(sql) %}
{%- endmacro %}