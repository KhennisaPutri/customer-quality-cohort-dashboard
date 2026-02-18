# dbt Models

This folder contains all dbt models used to build the cohort analytics layer.

## Structure

- staging/
  - Cleaned versions of raw BigQuery tables
- intermediate/
  - User-level cohort anchoring and lifecycle logic
- marts/
  - Cohort-level, BI-ready tables

## Design Principles

- One cohort per user (first purchase month)
- No user duplication
- Revenue-based retention metrics
- All business logic lives in dbt, not BI
