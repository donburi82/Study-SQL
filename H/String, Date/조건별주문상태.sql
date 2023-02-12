SELECT ORDER_ID, PRODUCT_ID,
    DATE_FORMAT(COALESCE(OUT_DATE, ''), '%Y-%m-%d') AS OUT_DATE,
    if(DATEDIFF('2022-05-01', OUT_DATE)>=0, '출고완료',
        if(OUT_DATE IS NULL, '출고미정', '출고대기')
      ) 출고여부
FROM FOOD_ORDER
ORDER BY 1;