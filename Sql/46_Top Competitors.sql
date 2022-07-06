select h.hacker_id, h.name
from Hackers h
inner join Submissions s ON h.hacker_id = s.hacker_id
inner join Challenges c ON s.challenge_id = c.challenge_id
where s.score = (select d.score from Difficulty d where c.difficulty_level = d.difficulty_level)
group by h.hacker_id, h.name
HAVING COUNT(h.hacker_id) > 1
ORDER BY COUNT(h.hacker_id) desc, h.hacker_id asc;