{{ config(
    materialized='table',
    schema='analytical',
    post_hook="ALTER TABLE {{ this }} SET OPTIONS(description='Table Purpose: .... {{ malloy_logic | replace(\"\'\", \"\\\\\'\") | trim }}')"
) }}

---Malloy SQL

    SELECT 
   CASE WHEN (COALESCE((COUNT(DISTINCT orders_0.`__distinct_key`))!=0,true)) THEN ((COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`product_price`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0))/(COUNT(DISTINCT orders_0.`__distinct_key`))) ELSE 0 END as `product_value_per_order`,
   CASE WHEN (COALESCE((COUNT(DISTINCT orders_0.`__distinct_key`))!=0,true)) THEN ((COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`supply_cost`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0))/(COUNT(DISTINCT orders_0.`__distinct_key`))) ELSE 0 END as `product_cost_per_order`,
   (CASE WHEN (COALESCE((COUNT(DISTINCT orders_0.`__distinct_key`))!=0,true)) THEN ((COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`product_price`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0))/(COUNT(DISTINCT orders_0.`__distinct_key`))) ELSE 0 END)-(CASE WHEN (COALESCE((COUNT(DISTINCT orders_0.`__distinct_key`))!=0,true)) THEN ((COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`supply_cost`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0))/(COUNT(DISTINCT orders_0.`__distinct_key`))) ELSE 0 END) as `gross_margin_per_order`,
   COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`product_price`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0) as `product_value`,
   COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`supply_cost`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0) as `product_supply_cost`,
   (COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`product_price`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0))-(COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(order_items_0.`supply_cost`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(order_items_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0)) as `gross_margin_total`,
   COUNT(DISTINCT orders_0.`__distinct_key`) as `order_count`,
   COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(orders_0.`order_total`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0) as `order_value`,
   (COALESCE(CAST(((
      SUM(DISTINCT ROUND(CAST(COALESCE(orders_0.`order_total`, 0) AS NUMERIC)*1, 9) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
      - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders_0.`__distinct_key` AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001)
    )/1) AS FLOAT64),0))/(NULLIF((COUNT(DISTINCT orders_0.`__distinct_key`)),0)) as `order_avg_value`
FROM (
  -- SELECT  "customers"      AS stage,
  -- UNION ALL
  -- SELECT  "locations"      AS stage,
  -- UNION ALL
  SELECT  "order_items"    AS stage,
  UNION ALL
  SELECT  "orders"         AS stage,
  -- UNION ALL
  -- SELECT  "products"       AS stage,
  -- UNION ALL
  -- SELECT  "supplies"       AS stage
) as base
 LEFT JOIN (SELECT GENERATE_UUID() as `__distinct_key`, x.*  FROM `my-1-st-project-training.dbt_maksim_ml.order_items` as x) AS order_items_0
  ON base.`stage`='order_items'
 LEFT JOIN (SELECT GENERATE_UUID() as `__distinct_key`, x.*  FROM `my-1-st-project-training.dbt_maksim_ml.orders` as x) AS orders_0
  ON base.`stage`='orders'

-- Malloy SQL