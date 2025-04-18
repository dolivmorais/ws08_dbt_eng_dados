


SELECT 
 account_id 					
, a.customer_id 
, customer_city as city_id
, created_at as account_cread_at
, status as account_status
, account_branch
, account_check_digit
, account_number
, first_name as custumer_firt_name
, last_name as custumer_last_name
, cpf as custumer_cpf
FROM "postgres"."bronze"."accounts" a
left join "postgres"."bronze"."customers" c
	on c.customer_id = a.customer_id