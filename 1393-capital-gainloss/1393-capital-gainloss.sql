WITH buys AS (
    SELECT
        stock_name,
        price AS buy_price,
        operation_day,
        ROW_NUMBER() OVER (PARTITION BY stock_name ORDER BY operation_day) AS rn
    FROM Stocks
    WHERE operation = 'Buy'
),
sells AS (
    SELECT
        stock_name,
        price AS sell_price,
        operation_day,
        ROW_NUMBER() OVER (PARTITION BY stock_name ORDER BY operation_day) AS rn
    FROM Stocks
    WHERE operation = 'Sell'
)
SELECT
    b.stock_name,
    SUM(s.sell_price - b.buy_price) AS capital_gain_loss
FROM buys b
JOIN sells s
    ON b.stock_name = s.stock_name
   AND b.rn = s.rn
GROUP BY b.stock_name;
