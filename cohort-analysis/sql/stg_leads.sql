-- Staging model for leads
-- Grain: one row per lead_id

SELECT
    lead_id,
    created_at,
    lead_source,
    lead_status,
    email,
    company,
    country,
    state,
    industry,
    to_date(created_at AS date) AS lead_created_date
FROM {{ source('salesforce', 'leads') }};
