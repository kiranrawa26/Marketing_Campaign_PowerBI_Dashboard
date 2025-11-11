## 🧱 SQL – Table Creation & Data Cleaning

Below SQL script is used to create and clean the `marketing_campaigns` table before performing analysis in Power BI and Excel.

```sql
-- Create database and use it
CREATE DATABASE marketing;
SET sql_safe_updates = 0;
USE marketing;

-- Table creation
CREATE TABLE marketing_campaigns (
    Campaign_ID INT PRIMARY KEY,
    Company TEXT,
    Campaign_Type TEXT,
    Target_Audience TEXT,
    Duration VARCHAR(100),
    Channel_Used TEXT,
    Conversion_Rate DECIMAL(5, 2),
    Acquisition_Cost TEXT,
    ROI TEXT,
    Location VARCHAR(100),
    Language TEXT,
    Clicks INT,
    Impressions INT,
    Engagement_Score DECIMAL(6, 2),
    Customer_Segment VARCHAR(100),
    Date DATE
);

-- Load data from CSV file
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/marketing_campaign_dataset.csv'
INTO TABLE marketing_campaigns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Verify table structure
DESCRIBE marketing_campaigns;

-- Clean and convert data types for numeric columns
UPDATE marketing_campaigns 
SET 
    Acquisition_Cost = CAST(REPLACE(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', ''), ' ', '') AS DECIMAL(10,2)),
    ROI = CAST(REPLACE(REPLACE(ROI, '%', ''), ',', '') AS DECIMAL(6,2));
