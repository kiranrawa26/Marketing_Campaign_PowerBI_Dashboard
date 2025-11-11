create database marketing;
set sql_safe_updates = 0;
use marketing;

CREATE TABLE marketing_campaigns (
    Campaign_ID INT PRIMARY KEY,
    Company TEXT,
    Campaign_Type TEXT,
    Target_Audience TEXT,
    Duration varchar(100),
    Channel_Used TEXT,
    Conversion_Rate DECimal(5 , 2 ),
    Acquisition_Cost text,
    ROI text,
    Location VARCHAR(100),
    Language TEXT,
    Clicks INT,
    Impressions INT,
    Engagement_Score DECIMAL(6 , 2 ),
    Customer_Segment VARCHAR(100),
    Date DATE
);

load data infile "C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/marketing_campaign_dataset.csv"
into table marketing_campaigns
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

describe marketing_campaigns;

UPDATE marketing_campaigns 
SET 
    acquisition_cost = CAST(REPLACE(REPLACE(REPLACE(acquisition_cost, '$', ''),
                ',',
                ''),
            ' ',
            '')
        AS DECIMAL (10 , 2 )),
    ROI = CAST(REPLACE(REPLACE(roi, '%', ''), ',', '') AS DECIMAL (6 , 2 ));
    
