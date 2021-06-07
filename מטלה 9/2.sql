select PROFILE.FIRST_NAME , count(*) as c
from PROFILE
group by PROFILE.FIRST_NAME
order by c
