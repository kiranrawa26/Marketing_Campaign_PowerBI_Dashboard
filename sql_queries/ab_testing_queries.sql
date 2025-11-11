Q1 - Compare the average Conversion Rate and ROI between Email and Social Media campaigns to determine which performed better.
  SELECT 
    Campaign_Type,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    COUNT(*) AS Total_Campaigns
FROM marketing_campaigns
WHERE Campaign_Type IN ('Email', 'Social Media')
GROUP BY Campaign_Type;

Q2.Compare ROI performance between “Email” and “Display” campaigns to identify which type gives better returns.
  SELECT 
    Campaign_Type,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    COUNT(*) AS Total_Campaigns
FROM marketing_campaigns
WHERE Campaign_Type IN ('Email', 'Display')
GROUP BY Campaign_Type;

Q3.Compare Customer Segments (“High Income” vs “Low Income”) to see who converts better and gives higher ROI.
  SELECT 
    Customer_Segment,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Engagement_Score), 2) AS Avg_Engagement
FROM marketing_campaigns
WHERE Customer_Segment IN ('High Income', 'Low Income')
GROUP BY Customer_Segment;

Q4.Check if urban campaigns perform better than rural campaigns in terms of ROI and Conversion Rate.
SELECT 
    Location,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    ROUND(AVG(Engagement_Score), 2) AS Avg_Engagement
FROM marketing_campaigns
WHERE Location IN ('Urban', 'Rural')
GROUP BY Location;

  
