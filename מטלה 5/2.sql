
SELECT profile_id, post_id, number_of_likes
FROM post p1
WHERE number_of_likes =(
                    SELECT max(number_of_likes) 
                     FROM post p2 natural join
                                  ( SELECT   profile_id
                                FROM   profile 
                                minus
                                SELECT   profile_id
                                FROM   post_comment))
;
SELECT pr.profile_id, first_name, last_name, avg(number_of_likes), count(*) as num_of_post
FROM profile pr, post po
WHERE pr.profile_id = po.profile_id
GROUP BY pr.profile_id, first_name, last_name
HAVING count(*) > 1 and avg(number_of_likes) > 1500  
;
SELECT profile_id, first_name,last_name, gender
FROM profile pr
WHERE NOT EXISTS(
        SELECT post_type_code
        FROM post_type pt
        WHERE NOT EXISTS(
                        SELECT po.post_id
                        FROM post po
                        WHERE po.post_type_code = pt.post_type_code and po.profile_id = pr.profile_id))
; 

SELECT profile_id , first_name, last_name, max(p.number_of_likes)
                     FROM post p natural join
                                (SELECT   profile_id
                                FROM   post_comment natural join (select post_id, post_type_code from post) T1 natural join post_type
                                where post_type_name = 'NORMAL') T
                                natural join profile
group by profile_id , first_name, last_name
;

