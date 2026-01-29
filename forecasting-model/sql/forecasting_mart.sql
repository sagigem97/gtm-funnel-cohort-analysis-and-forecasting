-- Final forecasting mart
-- Purpose: Produce owner-level forecasting metrics including weighted pipeline, expected bookings, quota coverage, and gap to goal.
-- Grain: One row per owner_id per quota_period
-- Inputs: int_forecast_prep (weighted pipeline + quota)
-- Outputs: forecasting metrics for GTM leadership

WITH prep AS (
    SELECT
        owner_id,
        opportunity_id,
        amount,
        weighted_pipeline,
        close_date,
        quota_amount,
        quota_period
    FROM {{ ref('int_forecast_prep') }}
),

-- Aggregate opportunity-level data to owner × quota_period grain 
-- Purpose: Summarize weighted pipeline, unweighted pipeline, and quota for each owner 
-- Grain after this step: one row per owner_id per quota_period
owner_rollup AS (
    SELECT
        owner_id,
        quota_period,
        sum(weighted_pipeline) AS total_weighted_pipeline,
        sum(amount) AS total_pipeline,
        max(quota_amount) AS quota_amount
    FROM prep
    FROUP BY owner_id, quota_period
),

metrics AS (
    SELECT
        owner_id,
        quota_period,
        quota_amount,
        total_pipeline,
        total_weighted_pipeline,

        -- Expected bookings based on weighted pipeline
        total_weighted_pipeline AS expected_bookings,

        -- Pipeline coverage (total pipeline vs. quota)
        CASE 
            WHEN quota_amount > 0 THEN total_pipeline / quota_amount
            ELSE NULL
        END AS pipeline_coverage,

        -- Weighted coverage (expected bookings vs. quota)
        CASE 
            WHEN quota_amount > 0 THEN total_weighted_pipeline / quota_amount
            ELSE NULL
        END AS weighted_coverage,

        -- Gap to goal (quota minus expected bookings)
        quota_amount - total_weighted_pipeline AS gap_to_goal
    FROM owner_rollup
)

SELECT *
FROM metrics
ORDER BY quota_period, owner_id;
