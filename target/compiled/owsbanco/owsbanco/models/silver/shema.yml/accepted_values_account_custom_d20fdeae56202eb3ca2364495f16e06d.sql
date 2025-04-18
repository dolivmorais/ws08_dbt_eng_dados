
    
    

with all_values as (

    select
        account_status as value_field,
        count(*) as n_records

    from "postgres"."gold"."account_customer"
    group by account_status

)

select *
from all_values
where value_field not in (
    'active','inactive'
)


