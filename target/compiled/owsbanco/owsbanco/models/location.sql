select
	s.state_id ,
	c.city_id ,
	s.country_id,
	c.city ,
	s.state,
	co.country
from bronze.city c 
	left join bronze.state s
		on s.state_id  = c.state_id 
	left join bronze.country co
		on co.country_id = s.country_id