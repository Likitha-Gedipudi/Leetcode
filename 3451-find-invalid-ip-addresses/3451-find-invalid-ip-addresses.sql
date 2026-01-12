SELECT 
    ip,
    COUNT(*) AS invalid_count
FROM logs
WHERE 
    -- Condition 1: Not exactly 4 octets
    LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) <> 3
    
    -- Condition 2: Any octet > 255
    OR EXISTS (
        SELECT 1
        FROM (
            SELECT 
                SUBSTRING_INDEX(ip, '.', 1) AS a,
                SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS b,
                SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS c,
                SUBSTRING_INDEX(ip, '.', -1) AS d
        ) AS oct
        WHERE 
            a REGEXP '^[0-9]+$' AND a > 255 OR
            b REGEXP '^[0-9]+$' AND b > 255 OR
            c REGEXP '^[0-9]+$' AND c > 255 OR
            d REGEXP '^[0-9]+$' AND d > 255
    )

    -- Condition 3: Leading zeros in any octet (but allow single zero)
    OR ip REGEXP '(^|\\.)0[0-9]+(\\.|$)'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
