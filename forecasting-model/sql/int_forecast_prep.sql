-- Intermediate model for forecasting
-- Purpose: Join weighted pipeline to quota to prepare for forecasting mart
-- Grain: One row per opportunity_id (with owner-level quota joined)
-- Inputs: int_weighted_pipeline, stg_quota
-- Outputs: unified dataset for forecasting_mart

WITH weighted AS (
    SELECT
        owner_id,
        opportunity_id,
        amount,
        weighted_pipeline,
        close_date
    FROM {{ ref('int_weighted_pipeline') }}
),

quota AS (
    SELECT
        owner_id,
        quota_amount,
        quota_period
    FROM {{ ref('stg_quota') }}
)

SELECT
    w.owner_id,
    w.opportunity_id,
    w.amount,
    w.weighted_pipeline,
    w.close_date,
    q.quota_amount,
    q.quota_period
FROM weighted w
LEFT JOIN quota q
    ON w.owner_id = q.owner_id;
