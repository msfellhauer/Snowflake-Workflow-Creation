-- Create or Replace Table (Mock Version)
CREATE OR REPLACE TABLE Snowflake_DB.Snowflake_Schema.Snowflake_table
CLUSTER BY (funding_date) AS
SELECT *
FROM Snowflake_DB.Snowflake_Schema.table_2_mock a
LEFT JOIN Snowflake_DB.Snowflake_Schema.table_3_mock b
ON a.cust_number = b.cust_number
WHERE business_date = CURRENT_DATE() - 1;


-- Task Creation (Mock Version)
CREATE OR REPLACE TASK daily_Update
WAREHOUSE = Snowflake_Warehouse
SCHEDULE = 'USING CRON 0 6 * * * America/Los_Angeles'
COMMENT = 'Overwrites Snowflake_DB.Snowflake_Schema.Snowflake_table every day at 6:00 AM PST'
COPY GRANTS
AS
SELECT *
FROM Snowflake_DB.Snowflake_Schema.table_2_mock a
LEFT JOIN Snowflake_DB.Snowflake_Schema.table_3_mock b
ON a.cust_number = b.cust_number
WHERE business_date = CURRENT_DATE() - 1;
