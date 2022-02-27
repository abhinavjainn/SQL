-- Google BigQuery
-- Find out top 5 products with most views excluding duplicate views by a visitor
-- i.e. taking into account one view per vistor for a product.

SELECT
  product_name,
  COUNT(*) AS product_views
FROM (
  SELECT
    DISTINCT v2ProductName AS product_name,
    fullVisitorId
  FROM
    `data-to-insights.ecommerce.all_sessions` )
GROUP BY
  product_name
ORDER BY
  product_views DESC
LIMIT
  5;