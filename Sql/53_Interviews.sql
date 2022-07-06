select con.contest_id, con.hacker_id, con.name, 
    SUM(ss.total_submissions), SUM(ss.total_accepted_submissions), 
    SUM(vs.total_views), SUM(vs.total_unique_views)
from contests con
inner join colleges col ON con.contest_id = col.contest_id
inner join challenges cha ON col.college_id = cha.college_id
left join (select challenge_id, SUM(total_views) as total_views, SUM(total_unique_views) as total_unique_views from view_stats group by challenge_id) vs ON cha.challenge_id = vs.challenge_id
left join (select challenge_id, SUM(total_submissions) as total_submissions, SUM(total_accepted_submissions) as total_accepted_submissions from submission_stats group by challenge_id) ss ON cha.challenge_id = ss.challenge_id
group by con.contest_id, con.hacker_id, con.name
having SUM(ss.total_submissions) > 0 OR SUM(ss.total_accepted_submissions) > 0 OR SUM(vs.total_views) > 0 OR SUM(vs.total_unique_views) > 0
order by con.contest_id