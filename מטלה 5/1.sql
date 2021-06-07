select gender, avg(number_of_likes), max(number_of_likes), min(number_of_likes), count(*)
from post natural join profile
group by gender;


select profile_id,  first_name, last_name, post_id, number_of_likes
from post natural join profile
where number_of_likes >= (
                            select avg(number_of_likes)
                            from post
                         );


select profile_id, first_name, last_name, gender
from post natural join profile
where post_id in (select post_id
from (select post_id , count(*)
    from post_comment
    group by post_id
    having count(*) >=(
                        select avg(c)
                        from (select post_id, count(*) as c
                        from post_comment
                        group by post_id) t
                        )
     ) )
   


intersect

select profile_id , first_name, last_name, gender
from post natural join profile
where number_of_likes>=(
                        select avg(number_of_likes)
                        from post
                        )
                       
;


select profile_id, first_name, last_name, gender
from profile natural join post_comment
group by profile_id, first_name, last_name, gender
having count(*)> (select avg(c) from (
                                           select profile_id, count(*) as c
                                           from post_comment
                                           group by profile_id
                                          ) );
