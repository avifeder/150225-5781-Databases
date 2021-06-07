select post_date, sum(number_of_likes) as number_of_likes
from POST
group by post_date
order by post_date
