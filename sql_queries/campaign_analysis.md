## 📊 SQL Analysis Queries

These SQL queries were used to analyze marketing campaign performance across channels, campaign types, and engagement metrics.

---

### 🧩 Q1: Which campaign type generated the highest average ROI?
```sql
SELECT 
    campaign_type, 
    ROUND(AVG(roi),2) AS avg_roi
FROM marketing_campaigns
GROUP BY campaign_type
ORDER BY AVG(roi) DESC;
```

---

### 📈 Q2: Which channel had the best click-to-conversion efficiency?
```sql
SELECT 
    channel_used AS channel,
    ROUND(SUM(clicks) / SUM(impressions) * 100, 2) AS CTR,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate
FROM marketing_campaigns
GROUP BY channel
ORDER BY CTR DESC;
```

---

### 💰 Q3: Find the cost per conversion for each campaign type
```sql
SELECT 
    Campaign_Type,
    ROUND(SUM(Acquisition_Cost) / SUM(Clicks), 2) AS Cost_Per_Click,
    ROUND(SUM(Acquisition_Cost) / COUNT(Campaign_ID), 2) AS Cost_Per_Campaign
FROM marketing_campaigns
GROUP BY Campaign_Type;
```

---

### ⭐ Q4: Top 5 campaigns with highest engagement-to-cost ratio
```sql
SELECT 
    Campaign_ID,
    Company,
    ROUND(SUM(Engagement_Score) / SUM(Acquisition_Cost), 2) AS Engagement_Cost_Ratio
FROM marketing_campaigns
GROUP BY Campaign_ID, Company
ORDER BY Engagement_Cost_Ratio DESC
LIMIT 5;
```

---

### 📅 Q5: Which channels show consistent growth month over month?
```sql
SELECT 
    Channel_Used,
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    ROUND(AVG(ROI), 2) AS Avg_ROI
FROM marketing_campaigns
GROUP BY Channel_Used, Month
ORDER BY Channel_Used, Month;
```
## 📊 Advanced Campaign Analysis (SQL)

These queries go beyond A/B testing — they focus on identifying performance trends, audience efficiency, and optimization opportunities.

---

### 💰 Q6: Identify campaigns with high cost but low ROI
```sql
SELECT 
    Campaign_ID, 
    Campaign_Type,
    Channel_Used,
    ROI, 
    Acquisition_Cost
FROM marketing_campaigns
WHERE ROI < 0.1 
  AND Acquisition_Cost > (SELECT AVG(Acquisition_Cost) FROM marketing_campaigns)
ORDER BY Acquisition_Cost DESC;
```

---

### 📈 Q7: Monthly ROI trend to check performance over time
```sql
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    ROUND(AVG(ROI), 2) AS Avg_Monthly_ROI
FROM marketing_campaigns
GROUP BY Month
ORDER BY Month;
```

---

### ⭐ Q8: Which month had the highest engagement rate overall
```sql
SELECT 
    DATE_FORMAT(Date, '%b') AS Month,
    ROUND(AVG(Engagement_Score), 2) AS Avg_Engagement
FROM marketing_campaigns
GROUP BY Month
ORDER BY Avg_Engagement DESC;
```

---

### 🎯 Q9: Which audience segment has the highest average ROI
```sql
SELECT 
    Target_Audience,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion
FROM marketing_campaigns
GROUP BY Target_Audience
ORDER BY Avg_ROI DESC;
```

---

### 🌍 Q10: Which language performed best in terms of engagement
```sql
SELECT 
    Language,
    ROUND(AVG(Engagement_Score), 2) AS Avg_Engagement,
    ROUND(AVG(ROI), 2) AS Avg_ROI
FROM marketing_campaigns
GROUP BY Language
ORDER BY Avg_Engagement DESC;
```
