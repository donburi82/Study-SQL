SELECT ii.INGREDIENT_TYPE, SUM(fh.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF AS fh INNER JOIN ICECREAM_INFO AS ii
ON fh.FLAVOR=ii.FLAVOR
GROUP BY 1
ORDER BY 2;