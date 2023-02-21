SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM(
    SELECT USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE
    FROM ONLINE_SALE
    UNION ALL
    SELECT NULL AS USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE
    FROM OFFLINE_SALE
) AS T
WHERE SALES_DATE LIKE '2022-03%'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID