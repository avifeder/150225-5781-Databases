select * from ydemri.friendshipsuggestion;
select * from ydemri.friendshiprequest;

select recieverid, count(*) as num_of_suggestion
from ydemri.friendshipsuggestion join ydemri.friendshiprequest
on recieverid=reciever_id and offerid=requester_id
group by recieverid
union
select recieverid, 0
from ydemri.friendshipsuggestion join ydemri.friendshiprequest
on recieverid=reciever_id
where recieverid not in (select recieverid
                         from ydemri.friendshipsuggestion join ydemri.friendshiprequest
                         on recieverid=reciever_id and offerid=requester_id
);


select f1.recieverid, count(*) as common_suggestion
from ydemri.friendshipsuggestion f1, ydemri.friendshipsuggestion f2
where f1.offerid = f2.recieverid and f1.recieverid = f2.offerid
and not exists
    (
    select offerid
    from ydemri.friendshipsuggestion t1
    where t1.recieverid = f1.recieverid
    minus
    select offerid
    from ydemri.friendshipsuggestion t2
    where t2.recieverid = f2.recieverid
    )
group by f1.recieverid;


