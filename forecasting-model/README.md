# Forecasting Model (SQL + dbt)

This directory contains the SQL and dbt models used to build a full-funnel
forecasting pipeline. The goal is to combine opportunity data, stage-level
probabilities, and quota information to produce accurate, owner-level
forecasting metrics.

## Overview

The forecasting model follows a structured analytics engineering workflow:

1. **Staging models**  
   Clean and standardize raw Salesforce opportunities and quota data.

2. **Intermediate models**  
   - Map opportunity stages to probability weights  
   - Apply weighted pipeline logic  
   - Join weighted pipeline to quota  

3. **Final mart**  
   Aggregate to owner × quota_period and compute business-ready forecasting
   metrics such as expected bookings, pipeline coverage, weighted coverage,
   and gap to goal.

## Model Flow

stg_opportunities
↓
int_stage_probabilities
↓
int_weighted_pipeline
↓
stg_quota
↓
int_forecast_prep
↓
forecasting_mart


## Final Output

The `forecasting_mart` model produces:

- **Expected bookings** (weighted pipeline)
- **Pipeline coverage** (pipeline ÷ quota)
- **Weighted coverage** (expected bookings ÷ quota)
- **Gap to goal** (quota − expected bookings)
- **Owner × quota_period grain**

These metrics support GTM leadership with a consistent, transparent forecasting
framework.

## Purpose

This forecasting pipeline demonstrates how to build a scalable, business-aligned
forecasting model using SQL and dbt. It is designed to be clear, auditable, and
easy to extend with additional forecasting logic (e.g., forecast accuracy,
scenario modeling, or rep-level forecasting).
