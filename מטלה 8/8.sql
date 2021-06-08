

SELECT * FROM BMARCUS.TAG;
SELECT * FROM BMARCUS.FRIENDS WHERE FRIEND_ID1=7794;



SELECT *
FROM 
       (SELECT FRIEND_ID1 AS FN1, TAG_ID, NUM AS NUM_TAGS
       FROM (
            (SELECT TAG_ID, COUNT(*) AS NUM
            FROM BMARCUS.TAG
            GROUP BY TAG_ID)
    
            NATURAL JOIN


            (SELECT DISTINCT FRIEND_ID1, TAG_ID 
            FROM BMARCUS.TAG, BMARCUS.FRIENDS
            WHERE FRIEND_ID1 = PROFILE_ID2))) 

        NATURAL JOIN     
       
       (SELECT FN1, TAG_ID, COUNT(*) AS MY_FRIENDS
       FROM BMARCUS.TAG NATURAL JOIN (
                                      SELECT DISTINCT FRIEND_ID1 AS FN1, TAG_ID 
                                       FROM BMARCUS.TAG, BMARCUS.FRIENDS
                                       WHERE FRIEND_ID1 = PROFILE_ID2)-- מי תויג ואיפה
                                       --מי תויג מי תייג איפה תויג ומי עוד תויג
       WHERE PROFILE_ID2 IN (SELECT FRIENd_ID2 
                             FROM BMARCUS.FRIENDS 
                             WHERE FRIEND_ID1 = FN1)   --שהמתויג הראשון חבר של המתויג השני
       GROUP BY FN1, TAG_ID)
       
WHERE NUM_TAGS = MY_FRIENDS;                 -- גקיבוץ לפי המתויג הראשון ומספר תיו
