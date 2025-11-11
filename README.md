# 📊 Marketing Campaign Performance Analysis

## 🧠 Project Overview
This project analyzes multi-channel marketing campaigns to evaluate **ROI**, **Conversion Rate**, **Customer Acquisition Cost**, and **Engagement Score** across various channels, audiences, and regions.

The goal was to identify which campaigns performed best, optimize marketing spend, and uncover audience behavior trends using **MySQL** and **Power BI**.

---

## 🗂️ Dataset
Source: [Kaggle – Marketing Campaign Performance Dataset](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset)

| Column Name | Description |
|--------------|-------------|
| Campaign_ID | Unique campaign identifier |
| Company | Brand/company running the campaign |
| Campaign_Type | Type of campaign (Email, Display, Social Media, etc.) |
| Target_Audience | Audience group targeted |
| Duration | Duration of the campaign in days |
| Channel_Used | Platform used (Email, Google Ads, YouTube, etc.) |
| Conversion_Rate | % of users converted |
| Acquisition_Cost | Cost to acquire a customer |
| ROI | Return on Investment |
| Location | Urban / Rural / Suburban |
| Language | Campaign language |
| Clicks | Total ad clicks |
| Impressions | Total ad impressions |
| Engagement_Score | Engagement metric combining clicks, likes, etc. |
| Customer_Segment | Segment like High Income / Low Income |
| Date | Campaign start date |

---

## ⚙️ Data Preparation
Data cleaning and transformation were performed using **MySQL** and **Power BI**:

- Removed symbols (`$`, `%`, `,`) from numeric fields using SQL REPLACE()  
- Casted text-based numbers into decimal values for analysis  
- Handled nulls and standardized channel names  
- Created new KPIs such as:
  - `CTR = Clicks / Impressions`
  - `Engagement_per_Click = Engagement_Score / Clicks`

---

## 💻 SQL Analysis (Conceptual)
SQL was used to:
- **Aggregate ROI** and Conversion by Campaign Type and Channel  
- **Compare Audience Segments** to find high-performing groups  
- **Analyze Monthly ROI Trends** using `DATE_FORMAT()`  
- **Identify Cost Inefficiencies** using conditional queries  
- **Perform A/B testing** between Email vs Display campaigns  




## 📈 Power BI Dashboard
The Power BI dashboard includes:
- ROI by Channel and Campaign Type  
- Engagement Score Trends (Monthly/Quarterly)  
- Conversion Rate by Audience Segment  
- KPI Cards for ROI, CAC, CTR, and Engagement  
- Filters for Audience, Channel, and Location  

**Dashboard Highlights**
- Social Media & Display campaigns gave 20%+ ROI  
- Urban audiences showed higher engagement and conversions  
- High-Income segments provided better ROI efficiency  
- Seasonal spikes observed in June and December  

---

## 💡 Insights & Recommendations
- Reallocate 15% of budget from underperforming Email campaigns to Display and Social Media channels.  
- Conduct targeted campaigns for High-Income and 25–34 age group segments.  
- Use engagement data to optimize timing around seasonal peaks.  
- Track CTR and ROI monthly for continuous improvement.  

---

## 🧾 Tools & Skills Used
- **SQL (MySQL)** → Data cleaning, aggregation, trend analysis, segmentation  
- **Power BI** → Dashboard design, DAX calculations, KPI visualization  
- **Excel** → Data validation, preprocessing before import  
- **Data Storytelling** → Translating results into actionable insights  


## 📬 Contact
**Author:** Kiran Rawat  
📧 Email: [kiranrawat2026@gmail.com]  
🌐 GitHub: [github.com/kiranrawa26](https://github.com/kiranrawa26)

---

⭐ *If you found this project useful, consider starring the repo!*
