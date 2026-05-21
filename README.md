# Google Merchandise Store · Ecommerce Analysis
Dashboard analyzing the Google Merchandise Store public dataset using BigQuery and Looker Studio,
covering traffic, revenue, product performance, and channel behavior across a 13-month period.

## Tools
BigQuery · Looker Studio

## Dataset
Public sample dataset from the Google Merchandise Store, available in BigQuery as
`bigquery-public-data.google_analytics_sample`. Contains real Google Analytics session-level data
from August 2016 to August 2017.

## Contents
- SQL queries in BigQuery (revenue, sessions, products, channels, devices, geography, visit frequency, weekday patterns)
- 7 CSV exports from BigQuery queries
- 3-page interactive Looker Studio dashboard

## Dashboard Pages
1. **Overview** — Monthly revenue & sessions trend, AOV and conversion rate evolution
2. **Products** — Top 15 products by revenue, units sold, views, and average price
3. **Channels & Devices** — Revenue and conversion rate by channel, device, and visit frequency

## Key Findings

### Channels
- **Organic** leads in transactions and revenue (excluding `none`), reinforcing the value of SEO as a long-term acquisition strategy
- **CPM** stands out with the highest average order value by a wide margin and a 2.43% conversion rate despite very few transactions, suggesting a high-intent audience
- **Referral** drives a significant number of sessions but has one of the lowest conversion rates, indicating a traffic quality issue

### Devices
- **Desktop** dominates both revenue and conversion rate
- **Tablet** shows a slightly higher conversion rate than mobile despite having far fewer sessions, possibly due to wider screens enabling better content and CTA display

### Geography
- **Japan** has roughly 3× the average order value of the United States
- **United States** leads by a wide margin in sessions, transactions, and total revenue

### Products
- The **Google 22 oz Water Bottle** is the top product by both revenue and units sold, and also the cheapest item in the top 15 — high volume at low price
- The **Google Rucksack** is the least popular: fewest views, fewest units sold, and the highest average price

### Time Patterns
- **December** has the highest number of transactions and one of the highest conversion rates, driven by the holiday season
- **January** has the lowest revenue and transactions, but the second-highest conversion rate — remaining intent after the holiday period
- **August 2017** shows near-zero sessions and transactions, consistent with an incomplete month in the dataset
- **Friday** has the highest conversion rate; **Saturday** the lowest — likely reflecting end-of-week intent vs. offline activity
- **Tuesday and Friday** generate the most revenue and sessions

### Visit Frequency
- Users converting on their **first visit** have a 0.66% conversion rate; by the **second visit** it more than doubles to 2.83%
- The third visit also shows a notable increase; from the fourth visit onward the gains are less significant
- Most sessions and transactions occur on visits 1 and 2, which also generate the most revenue
