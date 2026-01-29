-- Intermediate model: assign leads to cohorts
-- Grain: one row per lead_id

WITH leads AS (
    SELECT *
    FROM {{ ref('stg_leads') }}
)

SELECT
    lead_id,
    to_date(created_at) AS lead_created_date,
    date_trunc('month', to_date(created_at)) AS cohort_month,
    lead_source,
    lead_status,
    company,
    country,
    state,
    industry
FROM leads;
