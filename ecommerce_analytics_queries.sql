SELECT
  date,
  COUNT(*) AS total_sessions,
  SUM(totals.visits) AS total_visits,
  SUM(totals.transactions) AS total_transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY date
ORDER BY date;


SELECT
  trafficSource.medium AS channel,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(totals.transactions) / COUNT(*) * 100, 2) AS conversion_rate_pct,
  ROUND(SUM(totals.transactionRevenue) / 1000000 / NULLIF(SUM(totals.transactions), 0), 2) AS avg_order_value
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY channel
ORDER BY revenue_usd DESC;


SELECT
  device.deviceCategory AS device,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(totals.transactions) / COUNT(*) * 100, 2) AS conversion_rate_pct
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY device
ORDER BY revenue_usd DESC;


SELECT
  geoNetwork.country AS country,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(totals.transactionRevenue) / 1000000 / NULLIF(SUM(totals.transactions), 0), 2) AS avg_order_value
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY country
ORDER BY revenue_usd DESC
LIMIT 10;


SELECT
  FORMAT_DATE('%A', PARSE_DATE('%Y%m%d', date)) AS day_of_week,
  EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', date)) AS day_number,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(totals.transactions) / COUNT(*) * 100, 2) AS conversion_rate_pct
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY day_of_week, day_number
ORDER BY day_number;


SELECT
  visitNumber AS visit_number_bucket,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(totals.transactions) / COUNT(*) * 100, 2) AS conversion_rate_pct
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
  AND visitNumber <= 5
GROUP BY visit_number_bucket
ORDER BY visit_number_bucket;


SELECT
  p.v2ProductName AS product_name,
  p.v2ProductCategory AS category,
  COUNT(*) AS product_views,
  SUM(p.productQuantity) AS units_sold,
  ROUND(SUM(p.productRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(p.productRevenue) / 1000000 / NULLIF(SUM(p.productQuantity), 0), 2) AS avg_price,
  ROUND(SUM(p.productQuantity) / COUNT(*) * 100, 2) AS view_to_purchase_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS h,
  UNNEST(h.product) AS p
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
  AND p.productRevenue IS NOT NULL
GROUP BY product_name, category
ORDER BY revenue_usd DESC
LIMIT 15;


SELECT
  FORMAT_DATE('%Y-%m', PARSE_DATE('%Y%m%d', date)) AS month,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  ROUND(SUM(totals.transactionRevenue) / 1000000, 2) AS revenue_usd,
  ROUND(SUM(totals.transactions) / COUNT(*) * 100, 2) AS conversion_rate_pct,
  ROUND(SUM(totals.transactionRevenue) / 1000000 / NULLIF(SUM(totals.transactions), 0), 2) AS avg_order_value
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY month
ORDER BY month;