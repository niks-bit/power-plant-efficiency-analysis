# Mock Power Plant Efficiency Analysis - Q1,2024

This project investigates whether **high maintenance costs signal inefficiency** — or if they're symptoms of **deeper reliability problems** in plant operations. Using SQL, Excel analysis, and dashboard storytelling, we assess the performance of three fictional power plants:

- **Tagoloan Hydro**  
- **Balayan Thermal**  
- **Magat Hydro**

> An Excel dashboard was created to visualize the analysis and support business-level recommendations [see `.xlsx` file in repository].
<img width="1111" height="548" alt="Screenshot 2025-08-05 at 12 29 22 AM" src="https://github.com/user-attachments/assets/414514aa-f526-441b-8d99-151ad3d63b11" />

## Mock Datasets Used
These datasets were synthetically generated to simulate realistic patterns in operations, outages, and spending.

| Table | Description |
|-------|-------------|
| `plants` | Static info: plant_id, plant_name, region, type |
| `maintenance_logs` | Dates and costs of maintenance events |
| `output_logs` | Daily energy output (mWh) per plant |
| `downtime_logs` | Downtime hours per plant per day |

## SQL Analysis Overview

### Query 1: Total Maintenance Spend per Plant (USD)
Shows which plants had the highest maintenance spending — a baseline for cross-metric comparison.

### Query 2: Energy Output per $1 of Maintenance (mWh) 
Evaluates **cost efficiency**: how much mWh a plant generates for every dollar spent.

### Query 3: Total Downtime Hours per Plant (hrs) 
Measures how often a plant is offline. A key contributor to low output.

### Query 4: Maintenance Frequency Trend  
Tracks the number of maintenance activities over time — especially for chronic issues.

### Query 5: Energy Lost per Hour of Downtime (mWh) 
Calculates how much energy is "lost" every hour a plant is down. High loss = more costly downtime.

## Key Insights Summary

| Metric | Tagoloan Rank | Interpretation |
|--------|---------------|----------------|
| Maintenance Cost | Highest | Expensive to maintain |
| Output per $1 Spent | Lowest | Poor cost-efficiency |
| Total Downtime | Highest | Low availability |
| Maintenance Frequency | Rising | Likely recurring issues |
| Output per Downtime Hr | Lowest | Low yield even when online |

> **Conclusion:** Tagoloan’s high spend is likely **reactive maintenance** tied to reliability issues — not wasteful overspending. The real problem is **low availability** and **poor performance per dollar/hour**.

## Recommendations

1. **Root Cause Analysis** on frequent outages and breakdowns  
2. **Improve Repair Turnaround** — audit Mean Time to Repair (MTTR)  
3. **Review CapEx Needs** — assess asset age and modernize if needed  
4. **Refine Maintenance Strategy** — shift from reactive to preventive/predictive

## Future Work

- Extend analysis to **Q2 and beyond**  
- Incorporate **severity and type** of maintenance events  
- Explore automation or integration with **Looker Studio** or other BI tools 
- Break down **maintenance type** and severity  

