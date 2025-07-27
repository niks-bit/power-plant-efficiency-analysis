# Power Plant Maintenance & Performance Analysis

This project explores the maintenance, performance, and downtime data of three power plants: **Tagoloan Hydro**, **Balayan Thermal**, and **Magat Hydro**. The aim is to assess cost efficiency, reliability, and operational performance using SQL queries, Excel-based summaries, and visual dashboards.

> An initial **dashboard** has been built in Excel to visualize the insights below _[.xlxs file uploaded in files]_.

<img width="499" height="523" alt="Screenshot 2025-07-28 at 2 31 30 AM" src="https://github.com/user-attachments/assets/e43e05dc-7f96-4711-a66b-87a8ffde1a0e" />

## Datasets Used

- `plants` – Static info (plant_id, plant_name, region, type)  
- `maintenance_logs` – Dates and costs of maintenance  
- `output_logs` – Energy output per plant per date  
- `downtime_logs` – Downtime hours per plant per date  

## SQL Analysis Overview

### Query 1: Total Maintenance Spend per Plant  
Shows which plants had the highest maintenance spending — a baseline for cross-metric comparison.

### Query 2: Energy Output per $1 of Maintenance  
Evaluates **cost efficiency**: how much mWh a plant generates for every dollar spent.

### Query 3: Total Downtime Hours per Plant  
Measures how often a plant is offline. A key contributor to low output.

### Query 4: Monthly Maintenance Frequency Trend  
Tracks the number of maintenance activities over time — especially for chronic issues.

### Query 5: Energy Lost per Hour of Downtime  
Calculates how much energy is "lost" every hour a plant is down. High loss = more costly downtime.

## Key Insights Summary

- **Tagoloan Hydro**:
  - 🚨 Highest maintenance spend (USD)
  - ⚠️ Lowest energy output (mWh) per maintenance dollar  
  - 🕒 Highest total downtime hours  
  - 📈 Most frequent maintenance events (Q1)  
  - ⚡️ Lowest energy output (mWh) per hour of downtime  

> This may signal **aging infrastructure**, **inefficient repair cycles**, or **systemic availability issues**.

## Recommendations

1. Investigate **root causes** of Tagoloan's frequent downtime  
2. Audit **repair process duration** and delays  
3. Evaluate **asset condition and spending efficiency**

## Future Work

- Expand dashboards in **Tableau or Power BI**  
- Extend analysis to include other **quarters**  
- Break down **maintenance type** and severity  

