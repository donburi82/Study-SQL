SELECT b.CATEGORY, SUM(s.SALES) AS TOTAL_SALES
FROM BOOK b
JOIN BOOK_SALES s
ON b.BOOK_ID=s.BOOK_ID
WHERE DATE_FORMAT(s.SALES_DATE, '%Y-%m')='2022-01'
GROUP BY CATEGORY
ORDER BY 1;