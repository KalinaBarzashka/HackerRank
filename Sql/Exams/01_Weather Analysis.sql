SET NOCOUNT ON;

select MONTH(t.record_date), 
    (select MAX(tt.data_value) 
    from temperature_records tt
    group by MONTH(tt.record_date), tt.data_type
    having tt.data_type = 'max' 
        and MONTH(tt.record_date) = MONTH(t.record_date)
    ) as month_max,
    (select MIN(tt.data_value) 
    from temperature_records tt
    group by MONTH(tt.record_date), tt.data_type
    having tt.data_type = 'min' 
        and MONTH(tt.record_date) = MONTH(t.record_date)
    ) as month_min,
    (select CAST(ROUND(AVG(CAST(tt.data_value as float)), 0) as int)
    from temperature_records tt
    group by MONTH(tt.record_date), tt.data_type
    having tt.data_type = 'avg' 
        and MONTH(tt.record_date) = MONTH(t.record_date)
    ) as month_avg
from temperature_records t
group by MONTH(t.record_date)

go