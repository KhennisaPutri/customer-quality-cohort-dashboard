# dbt Models

This folder contains all dbt models used to build the cohort analytics layer.

## **Data Architecture**
### **Data Source**
* **BigQuery Public Dataset:** `bigquery-public-data.thelook_ecommerce`

### **dbt Model Layers**
```
staging/       → cleaned raw tables  
intermediate/  → cohort metrics logic  
marts/         → dashboard-ready tables  
```

## **Mart Tables**
* **`cohort_acquisition_metrics`** – New customers & first-order AOV
* **`cohort_revenue_monthly`** – Revenue retention curves
* **`cohort_repeat_metrics`** – Repeat rate & time to 2nd purchase
* **`cohort_ltv`** – 6-month customer LTV
* **`cohort_revenue_new_vs_returning`** – Revenue composition
* **`cohort_category_expansion`** – Cross-category purchasing behavior
* **`cohort_ops_metrics`** – Delivery time & return rate
* **`cohort_ltv_by_dc`** – LTV by distribution center
