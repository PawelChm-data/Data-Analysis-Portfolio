/*
    Purpose:
        Segment customers based on Recency, Frequency, and Monetary value (RFM).

    Output grain:
        One row per customer in the detailed RFM analysis;
        one row per customer segment in the final summary.

    Notes:
        - Customers without sales are excluded from RFM scoring.
        - RFM scores range from 1 to 5, based on NTILE(5).
        - Higher Recency scores indicate more recent purchases.
        - Segment definitions are illustrative business rules.
        - Recency is calculated using GETDATE() as the reference date.
*/


WITH Customer_RFM AS (
SELECT
c.customer_key,
CONCAT(c.first_name, ' ', c.last_name) AS full_name,
c.country,

-- Recency: days since last purchase
DATEDIFF(DAY, MAX(f.order_date), GETDATE()) AS recency_in_days,

-- Frequency: number of unique orders
COUNT(DISTINCT f.order_number) AS frequency,

-- Monetary: total customer spending
SUM(f.quantity * f.price) AS monetary

FROM gold.dim_customers AS c

LEFT JOIN gold.fact_sales AS f
ON c.customer_key = f.customer_key

GROUP BY
c.customer_key,
c.first_name,
c.last_name,
c.country
)

-- =====================================================
-- 2. Assign RFM Scores (1-5)
-- =====================================================

, Customer_RFM_Scores AS (
SELECT
customer_key,
full_name,
country,
recency_in_days,
frequency,
monetary,

-- Recency: lower number of days = higher score
NTILE(5) OVER (ORDER BY recency_in_days DESC) AS recency_score,

-- Frequency: more orders = higher score
NTILE(5) OVER (ORDER BY frequency ASC) AS frequency_score,

-- Monetary: higher spending = higher score
NTILE(5) OVER (ORDER BY monetary ASC) AS monetary_score

FROM Customer_RFM
WHERE frequency > 0
)

-- =====================================================
-- 3. Calculate RFM Score and Assign Segments
-- =====================================================

, Customer_RFM_Segments AS (
SELECT
*,
CONCAT(recency_score, frequency_score, monetary_score) AS rfm_score,

CASE
WHEN recency_score >= 4
AND frequency_score >= 4
AND monetary_score >= 4
THEN 'Champions'

WHEN frequency_score >= 4
AND monetary_score >= 3
THEN 'Loyal Customers'

WHEN recency_score <= 2
AND frequency_score >= 3
THEN 'At Risk'

WHEN recency_score <= 2
AND frequency_score <= 2
THEN 'Lost Customers'

ELSE 'Regular Customers'
END AS customer_segment

FROM Customer_RFM_Scores
)

-- =====================================================
-- 4. Customer Distribution and Segment Revenue
-- =====================================================

SELECT
    customer_segment,
    COUNT(*) AS total_customers,
    SUM(monetary) AS total_revenue,
    AVG(monetary) AS avg_customer_spending,
    AVG(recency_in_days) AS avg_recency_days,
    AVG(frequency) AS avg_frequency
FROM Customer_RFM_Segments
GROUP BY customer_segment
ORDER BY total_revenue DESC;