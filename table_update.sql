-- 02_create_daily_task.sql
-- -------------------------------------------------------------------
-- Create Daily Update Task (Demo Version)
-- -------------------------------------------------------------------
-- This task runs daily at 6:00 AM PST to refresh the clustered table.
-- The task ensures the table is updated with the previous day's data.
-- Clustering reduces runtime and compute usage, while the pre-joined table
-- ensures report stability for downstream SSRS reports.
-- -------------------------------------------------------------------

CREATE OR REPLACE TASK daily_Update
WAREHOUSE = Snowflake_Warehouse
SCHEDULE = 'USING CRON 0 6 * * * America/Los_Angeles'
COMMENT = 'Overwrites Snowflake_DB.Snowflake_Schema.Snowflake_table every day at 6:00 AM PST'
COPY GRANTS
AS
SELECT *
FROM Snowflake_DB.Snowflake_Schema.table_2 a
LEFT JOIN Snowflake_DB.Snowflake_Schema.table_3 b
ON a.cust_number = b.cust_number
WHERE business_date = CURRENT_DATE() - 1;
