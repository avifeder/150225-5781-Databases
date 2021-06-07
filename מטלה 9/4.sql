

create view friendship_request as(
select reciever_id as user_id, count(*) as requests
from ydemri.friendshiprequest
group by reciever_id

);

select * from friendship_request;


create view active_friendship as(
select friend_id1 as user_id, count(*) as friends
from bmarcus.friend
group by friend_id1

);

select * from active_friendship;