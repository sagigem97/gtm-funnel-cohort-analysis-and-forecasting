# gtm-funnel-cohort-analysis-and-forecasting
SQL + dbt project for GTM funnel cohort analysis and full-funnel forecasting, including pipeline coverage and win-rate modeling.

# GTM Funnel Cohort Analysis & Forecasting Models (SQL + dbt)

This repository contains two GTM analytics projects built using SQL and dbt. Both models follow a structured analytics engineering workflow and focus on clarity, reproducibility, and business impact.

---

## 1. Cohort Analysis: Lead → Opportunity → Win

This project builds a cohort framework that groups leads by creation period and tracks how they progress through the funnel. The model calculates:

- Lead → Opportunity conversion
- Opportunity → Win conversion
- Lead → Win conversion
- Funnel velocity and aging
- Cohort performance by segment and lead source

The dbt models include:
- **Staging:** Clean CRM lead and opportunity data
- **Intermediate:** Cohort assignment and lead–opportunity mapping
- **Mart:** Final cohort metrics for reporting

This analysis helps identify funnel friction, evaluate lead quality, and understand long‑term performance trends.

---

## 2. Full Funnel Forecasting & Pipeline Coverage

This project builds a forecasting model that combines historical performance with current pipeline to project bookings. The model includes:

- Stage‑based probability weighting
- Expected value forecasting
- Historical win rates and sales cycle modeling
- Pipeline coverage vs. quota
- Segment‑level projections

The dbt models include:
- **Intermediate:** Historical rates, open pipeline scoring, expected value calculations
- **Mart:** Final forecast combining weighted pipeline, win rates, and quota

This framework supports more accurate forecasting and earlier visibility into risk and pipeline gaps.

---
## Project Structure

```
gtm-funnel-cohort-analysis-and-forecasting/
│
├── cohort-analysis/
│   ├── sql/
│   ├── dbt/
│   └── docs/
│
├── forecasting-model/
│   ├── sql/
│   ├── dbt/
│   └── docs/
│
└── assets/
```


---

## Tools Used

- SQL (Snowflake-style syntax)
- dbt (staging → intermediate → marts)
- GTM funnel modeling
- Cohort analysis and forecasting logic

---

## Purpose

This repository demonstrates practical GTM analytics engineering work, including data modeling, funnel analysis, forecasting, and SQL/dbt development. It’s designed as a clear, business‑aligned example of how I approach building scalable analytics models.
