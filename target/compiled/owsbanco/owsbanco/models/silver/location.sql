

select
	s.state_id ,
	c.city_id ,
	s.country_id,
	c.city ,
	s.state,
	co.country
from "postgres"."bronze"."city" c 
	left join "postgres"."bronze"."state" s
		on s.state_id  = c.state_id 
	left join "postgres"."bronze"."country" co
		on co.country_id = s.country_id