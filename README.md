## **Project Overview**

This project builds a **cohort-based analytics dashboard** for a retail eCommerce business using **The Look Ecommerce public dataset (BigQuery)**. The dashboard focuses on LTV, repeat behavior, product mix, and operational impact. All transformation logic is implemented in **dbt**, while **Looker Studio** is used strictly for visualization.

## **Business Problem**

The business was consistently acquiring new customers but lacked clarity on Whether newer cohorts were as valuable as earlier ones, Which cohorts generated sustainable, long-term revenue, Whether retention challenges were driven by product behavior or operational performance.

## **Analytical Approach**
### **Cohort Definition**
* Customers grouped by **first purchase month**
* Each customer belongs to **one cohort only**
* Performance tracked across the customer lifecycle (Month 0–6)
