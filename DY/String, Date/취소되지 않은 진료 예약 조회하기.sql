SELECT A.APNT_NO, P.PT_NAME, P.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
FROM PATIENT P 
JOIN APPOINTMENT A
ON P.PT_NO = A.PT_NO
JOIN DOCTOR D
ON A.MDDR_ID = D.DR_ID
WHERE DATE_FORMAT(APNT_YMD, '%Y-%m-%d') = '2022-04-13' 
AND A.MCDP_CD = 'CS'
AND APNT_CNCL_YN = 'N'
ORDER BY APNT_YMD
