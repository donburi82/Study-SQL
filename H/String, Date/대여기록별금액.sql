with TRUCK AS (
    SELECT h.HISTORY_ID, c.CAR_TYPE, c.DAILY_FEE,
        DATEDIFF(h.END_DATE, h.START_DATE)+1 AS DURATION,
        CASE
            WHEN DATEDIFF(h.END_DATE, h.START_DATE)+1>=90 THEN '90일 이상'
            WHEN DATEDIFF(h.END_DATE, h.START_DATE)+1>=30 THEN '30일 이상'
            WHEN DATEDIFF(h.END_DATE, h.START_DATE)+1>=7 THEN '7일 이상'
            ELSE 'NONE'
        END AS TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
    JOIN CAR_RENTAL_COMPANY_CAR c
    ON c.CAR_ID=h.CAR_ID
    WHERE c.CAR_TYPE='트럭'
)

SELECT t.HISTORY_ID,
    ROUND(t.DAILY_FEE*t.DURATION*(100-COALESCE(p.DISCOUNT_RATE, 0))/100, 0) AS FEE
FROM TRUCK t
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN p
ON t.CAR_TYPE=p.CAR_TYPE AND t.TYPE=p.DURATION_TYPE
ORDER BY 2 DESC, 1 DESC;