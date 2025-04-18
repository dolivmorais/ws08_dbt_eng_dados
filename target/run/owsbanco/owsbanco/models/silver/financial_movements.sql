
  
    

  create  table "postgres"."gold"."financial_movements__dbt_tmp"
  
  
    as
  
  (
    

select 
	id
	, account_id
	, amount
	, transaction_requested_at
	, transaction_completed_at
	, status
	, in_or_out
	, 'trasnfer' as type
from "postgres"."gold"."trasnfer_in_out" 
union all
SELECT 
	id
	, account_id
	, pix_amount 
	, pix_requested_at 
	, pix_completed_at 
	, status
	,  replace(in_or_out,'pix_','')
	, 'pix' 
FROM "postgres"."bronze"."pix_movements"
  );
  