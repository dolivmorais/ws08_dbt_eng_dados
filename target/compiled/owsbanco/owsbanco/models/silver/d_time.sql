


with clean_d_time as(
	select 
	  time_id
	, action_timestamp::timestamp
	FROM "postgres"."bronze"."d_time"
)
select
  time_id
, action_timestamp
, date_part('year', action_timestamp) as action_year
, date_part('month',action_timestamp ) as action_month
, date_part('week',action_timestamp ) as action_week
, date_part('day', action_timestamp ) as action_day
FROM clean_d_time