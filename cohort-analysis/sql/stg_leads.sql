-- Staging model for leads
-- Grain: one row per lead_id

select
    lead_id,
    created_at,
    lead_source,
    lead_status,
    email,
    company,
    country,
    state,
    industry,
    cast(created_at as date) as lead_created_date
from {{ source('salesforce', 'leads') }};
