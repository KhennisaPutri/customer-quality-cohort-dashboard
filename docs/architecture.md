# Data Architecture

## Flow

BigQuery (raw)
→ dbt staging
→ dbt intermediate
→ dbt marts
→ Looker Studio
