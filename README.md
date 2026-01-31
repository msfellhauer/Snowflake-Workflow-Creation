# Snowflake Daily Update Demo

This repository demonstrates a workflow for updating a Snowflake table daily via a scheduled task.  

---

## Overview

This example illustrates how to implement a **daily data refresh** in Snowflake using a clustered table and a scheduled task. The focus is on workflow and structure — **no proprietary data is included**, and all table names are placeholders.  

**Note:**  

- If the underlying table did not involve a join, a **materialized view** could be appropriate.  
- In this scenario, the process was designed to **avoid large table scans**, resulting in a more efficient and cost-effective data load.  
- The output feeds an **SSRS report** filtered by the `funding_date` parameter, though the approach could be applied to any report or dashboard that filters by date.  
- The base dataset includes multiple **cartesian joins**, which caused long runtimes and high compute usage.  
- Given that the data only changes daily and **stakeholders did not require streaming data**, this approach was implemented.  
- As a result, **runtime was reduced by ~40%** due to clustering, and **report stability was improved** with a smaller, pre-joined table.

---

## Workflow

1. **Create or Replace Table**  
   A clustered table is created daily that joins two tables (`table_2` and `table_3`) based on `cust_number` and filters on the previous day's `business_date`.  

2. **Daily Task**  
   A Snowflake task runs every day at 6:00 AM PST to refresh the table.  

---

## SQL Scripts

1. `01_create_clustered_table.sql` – Creates the clustered table.  
2. `02_create_daily_task.sql` – Creates the scheduled daily update task.  

> Replace placeholder table names with actual table names when deploying in your environment. Adjust warehouse, schema, and table names as needed.  

---

## Notes

- This repo is intended to **demonstrate workflow only**; no real data is included.  
- The approach is generalizable and could be applied to any SSRS report or dashboard that filters on date.  
- Using clustering and pre-joined tables reduces runtime and stabilizes reporting for large datasets with expensive joins.
