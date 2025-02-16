--Select * from friends
--Select * from likes

--https://www.youtube.com/watch?v=aGKzhAkkOP8&t=312s
GO 
With new_table as (
Select F.user_id, l.page_id
from likes l
left Join friends f ON  l.user_id = f.friend_id
Group by l.user_id, l.page_id,F.user_id,F.user_id
),
likes_pages as (
Select f.friend_id,l.page_id
from friends f
Inner Join likes l on F.friend_id = l.user_id
Group by  f.friend_id,l.page_id
)
select distinct A.user_id, A.page_id FROM new_table A
LEFT JOIN likes_pages B on A.user_id = B.friend_id AND  A.page_id = B.page_id
WHERE b.friend_id is null
ORDER BY A.user_id ASC


