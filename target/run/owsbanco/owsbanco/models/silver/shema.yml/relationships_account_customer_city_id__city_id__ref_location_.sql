select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select city_id as from_field
    from "postgres"."silver"."account_customer"
    where city_id is not null
),

parent as (
    select city_id as to_field
    from "postgres"."silver"."location"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test