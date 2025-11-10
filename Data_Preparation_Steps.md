🧹 Data Preparation & Transformation – Marketing Campaign Performance Dashboard (Power BI)

This document outlines all the data cleaning, transformation, and calculation logic used to prepare the dataset for visualization in Power BI.  
The workflow involves two major phases:
1. Data Transformation in Power Query  
2. KPI Calculation using DAX measures

🧮 1️⃣ Power Query – Data Cleaning & Transformation

Performed in Power Query Editor before loading data into the Power BI data model.

🧹 Data Preparation Steps (Power Query)

Below are the detailed steps followed for data cleaning and transformation before visualization in Power BI:

1️⃣ Data Source
- Imported dataset: `marketing_campaign_performance.csv`  
- Source: Kaggle – Marketing Campaign Performance Dataset  
- Verified file integrity and column count before import

2️⃣ Remove Duplicates
- Removed duplicates based on `Campaign_ID` to ensure unique campaign records.  
- Verified row count difference before and after cleaning.

3️⃣ Handle Missing Values
- Checked nulls in key fields: `ROI`, `CAC`, and `Engagement_Score`.  
- Replaced missing numeric values with median (to avoid skew).  
- Ensured no NULL values remained in calculated metrics.
  
4️⃣ Standardize Column Names
- Renamed inconsistent column headers for clarity:  
  - `roi%` → `ROI`  
  - `cust_acq_cost` → `CAC`  
- Applied  naming convention (e.g., `Campaign_Type`, `Engagement_Score`).

5️⃣ Data Type Correction**
- Converted data types appropriately:  
  - `Date` → Date type
  - `ROI`, `Clicks`, `Impressions` → Decimal Number 
- Ensured consistent numeric formatting for DAX measures.

6️⃣ Derived Columns
- Created new calculated columns for KPIs:
  - `CTR` = `Clicks / Impressions`  
  - `ROI_Category` =  
    ```
    if ROI > 5 then "High ROI"
    else "Low ROI"
    ```
- Added business logic columns to support segmentation and visualization.

7️⃣ Outlier Treatment
- Applied percentile-based capping for extreme values in `CAC` and `ROI`.  
- Used 1st and 99th percentiles as lower and upper bounds.  
- Prevented distortion of average and trend metrics.

8️⃣ Text Standardization**
- Corrected inconsistent text values across campaign channels:  
  - `"fb"` → `"Facebook"`  
  - `"yt"` → `"YouTube"`  
  - `"email_mkt"` → `"Email Marketing"`  
- Ensured uniform casing and spelling for better filtering and grouping

9️⃣ Extracted Date Parts**
- Derived new time-based columns for trend analysis:
  - `Month`
  - `Quarter`
  - `Year`
- Enabled time-series visualizations (monthly and quarterly ROI trends).
  
🔟 Validated Totals**
- Compared aggregated totals (Impressions, Clicks, CAC) vs. original dataset.  
- Verified data accuracy after all transformations using summary tables.
- 
✅ Result:
Clean, standardized dataset ready for DAX modeling and Power BI visualization.

 📊 2️⃣ DAX Measures – KPI Calculations

All KPIs and derived metrics were created in the Model view → New Measure section.
 🧠 Campaign Performance Metrics

(a) Total Impressions
Total Impressions = SUM('Campaigns'[Impressions])

(b) Total Clicks
Total Clicks = SUM('Campaigns'[Clicks])

(c) Click Through Rate (CTR)
CTR = DIVIDE([Total Clicks], [Total Impressions], 0)

(d) Total Conversions
Total Conversions = SUM('Campaigns'[Conversions])

(e) Conversion Rate
Conversion Rate = DIVIDE([Total Conversions], [Total Clicks], 0)

💰 Financial KPIs

(a) Total CAC (Customer Acquisition Cost)
Total CAC = SUM('Campaigns'[CAC])

(b) Total Revenue (if provided)
Total Revenue = SUM('Campaigns'[Revenue])

(c) ROI
ROI = DIVIDE([Total Revenue] - [Total CAC], [Total CAC])

(d) Average ROI
Average ROI = AVERAGE('Campaigns'[ROI])


🔥 Engagement & Scoring

(a) Average Engagement Score
Avg Engagement = AVERAGE('Campaigns'[Engagement_Score])

(b) Engagement Category (Calculated Column)
Engagement Category =
IF('Campaigns'[Engagement_Score] > 70, "High",
   IF('Campaigns'[Engagement_Score] > 40, "Medium", "Low"))
   
📅 Time Intelligence (if you have a Date column)

(a) Campaigns per Month
Campaign Count = COUNT('Campaigns'[Campaign_ID])

(b) Previous Month ROI (for MoM growth)
Previous Month ROI =
CALCULATE([Average ROI], DATEADD('Date'[Date], -1, MONTH))

-- Month-over-Month ROI Growth %
MoM ROI Growth % =
DIVIDE([Average ROI] - [Previous Month ROI], [Previous Month ROI])
