# Write your MySQL query statement below
WITH user_categories AS (
    SELECT DISTINCT
        p.user_id,
        i.category
    FROM ProductPurchases p
    JOIN ProductInfo i
        ON p.product_id = i.product_id
),

pairs AS (
    SELECT
        u1.user_id,
        u1.category AS category1,
        u2.category AS category2
    FROM user_categories u1
    JOIN user_categories u2
        ON u1.user_id = u2.user_id
       AND u1.category < u2.category
)

SELECT
    category1,
    category2,
    COUNT(DISTINCT user_id) AS customer_count
FROM pairs
GROUP BY category1, category2
HAVING COUNT(DISTINCT user_id) >= 3
ORDER BY
    customer_count DESC,
    category1 ASC,
    category2 ASC;