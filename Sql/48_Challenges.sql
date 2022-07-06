select h.hacker_id, h.name, COUNT(c.challenge_id) as counts
from challenges c
inner join hackers h ON c.hacker_id = h.hacker_id
group by h.hacker_id, h.name
having COUNT(c.challenge_id) IN (
    select temp.counter
    FROM (select h1.hacker_id, COUNT(challenge_id) counter
    from challenges c1
    inner join hackers h1 ON c1.hacker_id = h1.hacker_id
    group by h1.hacker_id) as temp
    group by temp.counter
    having COUNT(temp.counter) = 1)
OR COUNT(c.challenge_id) = (
    select MAX(temp.counter)
    FROM (select h1.hacker_id, COUNT(challenge_id) counter
    from challenges c1
    inner join hackers h1 ON c1.hacker_id = h1.hacker_id
    group by h1.hacker_id) as temp)
order by counts desc, h.hacker_id;