create or replace view trand_profile as
(
select profile_id,  first_name, last_name, post_id, number_of_likes
from post natural join profile
where number_of_likes >= (
                            select avg(number_of_likes)
                            from post
                         )

);
                         
select * from trand_profile ;

create view active_profile as
(
select profile_id, first_name, last_name, gender
from profile natural join post_comment
group by profile_id, first_name, last_name, gender
having count(*)> (select avg(c) from (
                                           select profile_id, count(*) as c
                                           from post_comment
                                           group by profile_id
                                          ) )
);

select * from active_profile ;
