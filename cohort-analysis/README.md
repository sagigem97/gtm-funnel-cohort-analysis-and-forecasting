# Cohort Analysis Model (SQL + dbt)

This directory contains the SQL and dbt models used to build a full GTM funnel
cohort analysis. The goal is to group leads by their creation period and track
how they progress through the funnel from Lead → Opportunity → Win.

## Overview

The cohort analysis model follows a structured analytics engineering workflow:

1. **Staging models**  
   Clean and standardize CRM lead and opportunity data.

2. **Intermediate models**  
   - Assign leads to cohorts  
   - Map leads to opportunities  
   - Calculate funnel conversion metrics  
   - Compute velocity and aging metrics  

3. **Final mart**  
   Produce cohort-level funnel performance metrics for reporting and analysis.

## Model Flow

stg_leads
↓
stg_opportunities
↓
int_lead_cohorts
↓
int_lead_opportunity_mapping
↓
int_cohort_metrics
↓
cohort_mart


## Final Output

The `cohort_mart` model produces:

- **Lead → Opportunity conversion**
- **Opportunity → Win conversion**
- **Lead → Win conversion**
- **Funnel velocity and aging**
- **Cohort performance by segment, source, or timeframe**

These metrics help identify funnel friction, evaluate lead quality, and
understand long-term performance trends.

## Purpose

This cohort analysis pipeline demonstrates how to build a scalable, structured
GTM analytics model using SQL and dbt. It is designed to be clear, reproducible,
and aligned with analytics engineering best practices.
