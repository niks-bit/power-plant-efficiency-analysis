# Power Plant Maintenance & Performance Analysis

This project explores the maintenance, performance, and downtime data of three power plants: **Tagoloan Hydro**, **Balayan Thermal**, and **Magat Hydro**. The aim is to assess cost efficiency, reliability, and operational performance using SQL queries, Excel-based summaries, and visual dashboards.

> A final **dashboard** has been built in Excel to visualize the insights below.  
> <img width="436" height="431" alt="Screenshot 2025-07-28 at 1 59 17 AM" src="https://github.com/user-attachments/assets/c7e8824b-2aa6-4295-8700-93461a627dbe" />

## Datasets Used

- `plants` – Static info (plant_id, plant_name, region, type)  
- `maintenance_logs` – Dates and costs of maintenance  
- `output_logs` – Energy output per plant per date  
- `downtime_logs` – Downtime hours per plant per date  

## SQL Analysis Overview

### Query 1: Total Maintenance Spend per Plant  
Shows which plants had the highest maintenance spending — a baseline for cross-metric comparison.

### Query 2: Energy Output per $1 of Maintenance  
Evaluates **cost efficiency**: how much MWh a plant generates for every dollar spent.

### Query 3: Total Downtime Hours per Plant  
Measures how often a plant is offline. A key contributor to low output.

### Query 4: Monthly Maintenance Frequency Trend  
Tracks the number of maintenance activities over time — especially for chronic issues.

### Query 5: Energy Lost per Hour of Downtime  
Calculates how much energy is "lost" every hour a plant is down. High loss = more costly downtime.

## Key Insights Summary

- **Tagoloan Hydro**:
  - 🚨 Highest maintenance spend  
  - ⚠️ Lowest energy per maintenance dollar  
  - 🕒 Highest total downtime hours  
  - 📈 Most frequent maintenance events (increasing monthly)  
  - ⚡️ Lowest energy per hour of downtime  

> This may signal **aging infrastructure**, **inefficient repair cycles**, or **systemic availability issues**.

## Recommendations

1. Investigate **root causes** of Tagoloan's frequent downtime  
2. Audit **repair process duration** and delays  
3. Evaluate **asset condition and spending efficiency**

## Future Work

- Expand dashboards in **Tableau or Power BI**  
- Extend analysis to include other **quarters**  
- Break down **maintenance type** and severity  

