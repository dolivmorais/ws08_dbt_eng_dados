select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select city_id
from "postgres"."gold"."location"
where city_id is null



      
    ) dbt_internal_test