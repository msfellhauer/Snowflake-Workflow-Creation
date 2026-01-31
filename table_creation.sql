-- 01_create_clustered_table.sql
-- -------------------------------------------------------------------
-- Create or Replace Table (Demo Version)
-- -------------------------------------------------------------------
-- This table is clustered by funding_date to reduce query runtime.
-- It joins two tables on cust_number and filters by the previous day's business_date.
-- This approach avoids large table scans and improves efficiency compared to using a materialized view
-- when a join is required.
-- -------------------------------------------------------------------

CREATE OR REPLACE TABLE Snowflake_DB.Snowflake_Schema.Snowflake_table
CLUSTER BY (funding_date) AS
SELECT *
FROM Snowflake_DB.Snowflake_Schema.table_2 a
LEFT JOIN Snowflake_DB.Snowflake_Schema.table_3 b
ON a.cust_number = b.cust_number
WHERE business_date = CURRENT_DATE() - 1;
