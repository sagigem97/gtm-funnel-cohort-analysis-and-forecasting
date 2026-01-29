-- Intermediate model: join leads to opportunities
-- Grain: one row per opportunity_id (left join on leads)

WITH leads AS (
    SELECT *
    FROM {{ ref('stg_leads') }}
),

opps AS (
    SELECT *
    FROM {{ ref('stg_opportunities') }}
)

SELECT
    o.opportunity_id,
    o.lead_id,
    o.created_at AS opportunity_created_at,
    o.close_date,
    o.amount,
    o.stage,
    o.is_closed,
    o.is_won,
    l.created_at AS lead_created_at,
    l.lead_source,
    l.lead_status,
    l.company,
    l.country,
    l.state,
    l.industry,
    to_date(l.created_at) AS lead_created_date,
    to_date(o.created_at) AS opportunity_created_date
FROM opps AS o
left join leads AS l
    ON opps.lead_id = leads.lead_id;
