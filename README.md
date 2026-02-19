## **Project Overview**

This project builds a **cohort-based analytics dashboard** for a retail eCommerce business using **The Look Ecommerce public dataset (BigQuery)**. The dashboard focuses on LTV, repeat behavior, product mix, and operational impact. All transformation logic is implemented in **dbt**, while **Looker Studio** is used strictly for visualization.

## **Business Problem**

The business was consistently acquiring new customers but lacked clarity on Whether newer cohorts were as valuable as earlier ones, Which cohorts generated sustainable, long-term revenue, Whether retention challenges were driven by product behavior or operational performance.

## **Analytical Approach**
### **Cohort Definition**
* Customers grouped by **first purchase month**
* Each customer belongs to **one cohort only**
* Performance tracked across the customer lifecycle (Month 0–6)

### **Design Principles**
* Revenue-based metrics prioritized over user counts
* Clear grain separation (user-level vs cohort-level)
* No cohort logic or joins in the BI layer

## **Dashboard Structure**
The dashboard follows a **top-down business narrative**

### **1. Acquisition Quality**
* New customers by cohort
* First-order AOV trends
* First purchase product mix

### **2. Revenue Retention**
* Revenue retention curves (Month 0–6)
* Repeat purchase rate
* Time to second purchase

### **3. Monetization & LTV**
* LTV by cohort
* New vs returning revenue contribution

### **4. Product & Behavioral Signals**
* Category expansion rate
* Order frequency

### **5. Operational Impact**
* Average delivery time by cohort
* Return rate
* LTV by distribution center

### **6. Executive Summary**
* Best vs worst cohort comparison
* Clear, actionable recommendations

## **Data Governance**
* Cohort logic defined **once** in dbt
* No joins, blends, or recalculations in Looker Studio
* Metrics consistent across all dashboard views
