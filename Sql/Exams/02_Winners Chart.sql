SET NOCOUNT ON;

select final_res.event_id, string_agg(final_res.p_names, ' ')
from (select res.event_id, res.drank, string_agg(res.participant_name, ',') WITHIN GROUP (ORDER BY participant_name) as p_names
    from (select temp.event_id, temp.participant_name, temp.score,
        DENSE_RANK() OVER 
        (PARTITION BY temp.event_id ORDER BY temp.score desc) as drank
        from (select event_id, participant_name, MAX(score) as score
            from scoretable
            group by event_id, participant_name) as temp)
    as res
    group by res.event_id, res.drank
    having res.drank <= 3) as final_res
group by final_res.event_id
order by final_res.event_id

go