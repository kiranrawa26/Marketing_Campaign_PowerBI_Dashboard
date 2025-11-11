## 🧪 A/B Test Analysis

These SQL queries were designed to perform **A/B testing** between different campaign types, customer segments, and durations to evaluate marketing effectiveness.

---

### 📨 Q1: Compare the average Conversion Rate and ROI between Email and Social Media campaigns
```sql
SELECT 
    Campaign_Type,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    COUNT(*) AS Total_Campaigns
FROM marketing_campaigns
WHERE Campaign_Type IN ('Email', 'Social Media')
GROUP BY Campaign_Type;
```

---

### 💡 Q2: Compare ROI performance between Email and Display campaigns
```sql
SELECT 
    Campaign_Type,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    COUNT(*) AS Total_Campaigns
FROM marketing_campaigns
WHERE Campaign_Type IN ('Email', 'Display')
GROUP BY Campaign_Type;
```

---

### 👥 Q3: Compare High Income vs Low Income segments to see who converts better
```sql
SELECT 
    Customer_Segment,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Engagement_Score), 2) AS Avg_Engagement
FROM marketing_campaigns
WHERE Customer_Segment IN ('High Income', 'Low Income')
GROUP BY Customer_Segment;
```

---

### 🌆 Q4: Check if urban campaigns perform better than rural campaigns
```sql
SELECT 
    Location,
    ROUND(AVG(ROI), 2) AS Avg_ROI,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion_Rate,
    ROUND(AVG(Engagement_Score), 2) AS Avg_Engagement
FROM marketing_campaigns
WHERE Location IN ('Urban', 'Rural')
GROUP BY Location;
```

---

### ⏱️ Q5 Bonus: Analyze Campaign Duration impact on Conversion
```sql
SELECT 
    CASE 
        WHEN Duration > 30 THEN 'Long Campaign'
        ELSE 'Short Campaign'
    END AS Campaign_Length,
    ROUND(AVG(Conversion_Rate), 2) AS Avg_Conversion,
    ROUND(AVG(ROI), 2) AS Avg_ROI
FROM marketing_campaigns
GROUP BY Campaign_Length;
```
