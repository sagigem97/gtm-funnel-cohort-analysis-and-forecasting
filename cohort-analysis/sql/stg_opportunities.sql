-- Staging model for opportunities
-- Grain: one row per opportunity_id

SELECT
    opportunity_id,
    lead_id,
    created_at,
    close_date,
    amount,
    stage,
    is_closed,
    is_won,
    TO_DATE(created_at AS date) AS opp_created_date
FROM {{ source('salesforce', 'opportunities') }};
