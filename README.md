# Power Plant Maintenance & Performance Analysis

This project analyzes maintenance, performance, and downtime data across three power plants: **Tagoloan Hydro**, **Balayan Thermal**, and **Magat Hydro**. The goal is to investigate cost efficiency, availability issues, and operational performance using structured SQL queries.

## Datasets Used

- `plants` – Static info (plant_id, plant_name, region, type)
- `maintenance_logs` – Dates and costs of maintenance
- `output_logs` – Energy output per plant per date
- `downtime_logs` – Downtime hours per plant per date

## SQL Analysis Overview

### Query 1: Total Maintenance Spend per Plant
> Identifies which power plants spent most on maintenance. Used as baseline for comparison with output and downtime.

### Query 2: Energy Output per $1 of Maintenance
> Measures cost efficiency: how much energy (MWh) is produced per maintenance dollar. Reveals if high spend = high return.

### Query 3: Total Downtime Hours per Plant
> Measures how often plants are offline. High downtime may explain poor performance — not necessarily inefficiency.

### Query 4: Trend of Maintenance Frequency Over Time
> Looks for rising maintenance trends (especially Tagoloan). Helps detect possible chronic reliability issues.

### Query 5: Energy Lost per Hour of Downtime
> Quantifies the cost of downtime. Shows how much energy is lost per hour unavailable — higher = more painful losses.

## Final Insight Summary

- **Tagoloan Hydro** has:
  - Highest maintenance spend
  - Lowest energy per dollar
  - Highest total downtime
  - Rising maintenance frequency
  - Lowest energy generated per hour of downtime

> This indicates potential **systemic inefficiency**, **aging infrastructure**, or **chronic unavailability**.

### Recommendations:
1. Investigate **root causes of downtime**
2. Audit **repair time lags**
3. Review **asset condition and cost overruns**

## Future Work

- Visualize trends with Tableau
- Compare across more plants or years
- Investigate maintenance type impact

