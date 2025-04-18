{{ config(materialized='table') }}

select 
	id
	, account_id
	, amount
	, transaction_requested_at
	, transaction_completed_at
	, status
	, in_or_out
	, 'trasnfer' as type
from {{ ref('trasnfer_in_out') }} 
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
FROM {{ source('bronze', 'pix_movements') }}