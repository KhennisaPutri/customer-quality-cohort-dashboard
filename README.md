## **Project Overview**

This project builds a **cohort-based analytics dashboard** for a retail eCommerce business using **The Look Ecommerce public dataset (BigQuery)**. The dashboard focuses on LTV, repeat behavior, product mix, and operational impact. All transformation logic is implemented in **dbt**, while **Looker Studio** is used strictly for visualization.

## **Business Problem**
This cohort-based analysis explores why some customer groups create more long-term value than others by analyzing revenue contribution, repeat purchase behavior, and the operational factors that differentiate high-performing cohorts from underperforming ones.

## **Analytical Approach**
### **Cohort Definition**
* Each customer is assigned to a cohort based on the month of their first completed purchase.
* A customer belongs to exactly one cohort for their entire lifecycle.
* All subsequent behavior (revenue, repeat purchases, product expansion, operational experience) is analyzed relative to that first purchase moment.
