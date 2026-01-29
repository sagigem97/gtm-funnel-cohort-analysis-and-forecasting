-- Intermediate model: weighted pipeline
-- Grain: one row per opportunity_id

WITH opps AS (
    SELECT *
    FROM {{ ref('stg_opportunities') }}
),

probs AS (
    SELECT *
    FROM {{ ref('int_stage_probabilities') }}
)

SELECT
    o.opportunity_id,
    o.account_id,
    o.owner_id,
    o.stage,
    o.amount,
    o.created_at,
    o.close_date,
    o.created_month,
    o.close_month,
    p.probability,
    amount * probability AS expected_value,
    CASE
        WHEN probability >= 0.8 THEN 'Commit'
        WHEN probability >= 0.4 THEN 'Best Case'
        WHEN probability > 0 THEN 'Pipeline'
        ELSE 'Closed'
    END AS forecast_category
FROM opps AS o
LEFT JOIN probs AS p
    ON o.stage = p.stage;
