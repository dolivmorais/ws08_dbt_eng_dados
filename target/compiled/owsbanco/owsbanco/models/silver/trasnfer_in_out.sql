SELECT 
    id
    , account_id
    , amount
    , transaction_requested_at
    , transaction_completed_at
    , status, 'in' as in_or_out
FROM "postgres"."bronze"."transfer_ins"
union all
SELECT 
    id
    , account_id
    , amount
    , transaction_requested_at
    , transaction_completed_at
    , status
    , 'out' as in_or_out
FROM "postgres"."bronze"."transfer_outs"