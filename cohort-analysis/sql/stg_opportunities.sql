-- Staging model for opportunities
-- Grain: one row per opportunity_id

select
    opportunity_id,
    lead_id,
    created_at,
    close_date,
    amount,
    stage,
    is_closed,
    is_won,
    cast(created_at as date) as opp_created_date
from {{ source('salesforce', 'opportunities') }};
