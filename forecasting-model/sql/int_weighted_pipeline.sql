-- Intermediate model for forecasting 
-- Purpose: Apply stage-level probabilities to opportunities to calculate weighted pipeline 
-- Grain: One row per opportunity_id 
-- Inputs: stg_opportunities, int_stage_probabilities 
-- Outputs: weighted_pipeline per opportunity

WITH opp AS (
    SELECT
        opportunity_id,
        owner_id,
        amount,
        stage,
        close_date
    FROM {{ ref('stg_opportunities') }}
),

prob AS (
    SELECT
        stage,
        probability
    FROM {{ ref('int_stage_probabilities') }}
)

SELECT
    opp.opportunity_id,
    opp.owner_id,
    opp.amount,
    opp.stage,
    opp.close_date,
    prob.probability,
    opp.amount * prob.probability AS weighted_pipeline
FROM opp
LEFT JOIN prob
    ON opp.stage = prob.stage
