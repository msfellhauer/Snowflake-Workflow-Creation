# This is a simple script to form an external stage for the initial table creation. This will provide a data set
# for snowflake to pull in, and then update daily. 

### **2. generate_mock_data.py**
```python
import pandas as pd
import numpy as np

# Generate table_2 mock data
table_2 = pd.DataFrame({
    "cust_number": [1001, 1002, 1003],
    "funding_date": pd.to_datetime(["2026-01-30", "2026-01-30", "2026-01-30"]),
    "amount": [5000, 7000, 6500]
})
table_2.to_csv("mock_data/table_2_mock.csv", index=False)

# Generate table_3 mock data
table_3 = pd.DataFrame({
    "cust_number": [1001, 1002, 1003],
    "region": ["West", "East", "South"],
    "business_date": pd.to_datetime(["2026-01-30", "2026-01-30", "2026-01-30"])
})
table_3.to_csv("mock_data/table_3_mock.csv", index=False)
