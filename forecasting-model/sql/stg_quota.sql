-- Staging model for forecasting: quota
-- Grain: one row per rep_id per month

SELECT
    rep_id,
    segment,
    to_date(quota_month) AS quota_month,
    quota_amount
FROM {{ source('salesforce', 'quota') }};
