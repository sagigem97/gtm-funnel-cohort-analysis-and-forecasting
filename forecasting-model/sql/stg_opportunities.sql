-- Staging model for forecasting: opportunities
-- Grain: one row per opportunity_id

SELECT
    opportunity_id,
    account_id,
    owner_id,
    to_timestamp_ntz(created_at) AS created_at,
    to_timestamp_ntz(close_date) AS close_date,
    stage,
    amount,
    is_closed,
    is_won,
    to_date(created_at) AS created_date,
    to_date(close_date) AS close_date_only,
    date_trunc('month', to_date(created_at)) AS created_month,
    date_trunc('month', to_date(close_date)) AS close_month
FROM {{ source('salesforce', 'opportunities') }};
