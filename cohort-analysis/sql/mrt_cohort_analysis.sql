-- Final mart: cohort analysis
-- Grain: one row per lead_id per month since cohort start

WITH cohorts AS (
    SELECT *
    FROM {{ ref('int_lead_cohorts') }}
),

opps AS (
    SELECT *
    FROM {{ ref('int_lead_opportunity_join') }}
),

-- Calculate months since cohort start
calendar AS (
    SELECT
        cohort.lead_id,
        cohort.cohort_month,
        dateadd(
            month,
            seq4(),
            cohort.cohort_month
        ) AS month_start
    FROM cohorts AS cohort,
         table(generator(rowcount => 12))  -- 12 months of retention window
),

joined AS (
    SELECT
        c.lead_id,
        c.cohort_month,
        c.month_start,
        o.opportunity_id,
        o.is_won,
        o.amount,
        o.opportunity_created_date
    FROM calendar AS c
    LEFT JOIN opps AS o
        ON c.lead_id = o.lead_id
        AND date_trunc('month', o.opportunity_created_date) = c.month_start
)

SELECT
    lead_id,
    cohort_month,
    month_start AS activity_month,
    datediff('month', cohort_month, month_start) AS months_since_cohort,
    COUNT(DISTINCT opportunity_id) AS opp_count,
    sum(CASE WHEN is_won THEN 1 ELSE 0 END) AS won_count,
    sum(CASE WHEN is_won THEN amount ELSE 0 END) AS revenue
FROM joined
GROUP BY lead_id, cohort_month, activity_month, months_since_cohort
ORDER BY cohort_month, activity_month;
