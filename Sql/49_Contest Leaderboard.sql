select temp.hacker_id, temp.name, SUM(temp.score)
from(   
    select h.hacker_id, h.name, MAX(s.score) as score
    from hackers h
    inner join submissions s ON h.hacker_id = s.hacker_id
    group by h.hacker_id, h.name, s.challenge_id
) as temp
group by temp.hacker_id, temp.name
having SUM(temp.score) > 0
order by SUM(temp.score) desc, hacker_id asc