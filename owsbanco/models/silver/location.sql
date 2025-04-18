{{ config(materialized='table') }}

select
	s.state_id ,
	c.city_id ,
	s.country_id,
	c.city ,
	s.state,
	co.country
from {{ source('bronze', 'city') }} c 
	left join {{ source('bronze', 'state') }} s
		on s.state_id  = c.state_id 
	left join {{ source('bronze', 'country') }} co
		on co.country_id = s.country_id 