PRAGMA table_info(plants);
PRAGMA table_info(output_logs);
PRAGMA table_info(maintenance_logs);
PRAGMA table_info(downtime_logs);

-- Query 1: Total Maintenance Spend per Plant
-- Identifies which power plants spent most on maintenance
-- Will use later to compare with performance metrics

SELECT 
    p.plant_name,
    ROUND(SUM(m.maintenance_cost_usd), 2) AS total_maintenance_cost
FROM maintenance_logs m
JOIN plants p ON m.plant_id = p.plant_id
GROUP BY m.plant_id
ORDER BY total_maintenance_cost DESC;

*/ Tagoloan Hydro and Balayan Thermal had the highest total maintenance costs among all plants, at $41,042.18, over Balayan's $35,502.51 and Magat's $21,486.57.
This could mean they operate on a larger scale, or that they require more frequent and expensive upkeep 
— possibly due to aging infrastructure, inefficiencies, or even site-specific challenges.
But high spend alone doesn’t mean underperformance. To assess if the cost is justified, 
we look next at how much energy each plant actually produces per dollar spent. */ 

-- Query 2: Energy Output per $1 of Maintenance 
-- Measure how much energy each plant produces for every dollar spent on maintenance.
-- This tells us which plants are cost-efficient (high output for low spend), and which ones may be underperforming.

SELECT 
    p.plant_name,
    ROUND(SUM(o.energy_generated_mwh) / SUM(m.maintenance_cost_usd), 2) AS mwh_per_usd
FROM plants p
LEFT JOIN output_logs o ON p.plant_id = o.plant_id
LEFT JOIN maintenance_logs m ON p.plant_id = m.plant_id
GROUP BY p.plant_id
ORDER BY mwh_per_usd DESC;

*/ Balayan Thermal tops the list in energy output per maintenance dollar at $ 0.21, followed by Magat Hydro ($ 0.19) and Tagoloan Hydro ($ 0.18).
This flips the picture from Query 1, where Tagoloan had the highest maintenance spend — but here it's least efficient among the three.
This raises key questions:
1) Is Tagoloan spending more without seeing proportional energy gains?
2) Is it dealing with aging assets or operational inefficiencies?
3) Or does its energy capacity lag behind its cost structure?
We'll now look at downtime to see if unavailability plays a role in this inefficiency. */

-- Query 3: Total Downtime Hours per Plant 
-- Identify which plants spend the most time offline
-- High downtime could explain poor energy output per maintenance dollar not inefficiency

SELECT 
    p.plant_name,
    SUM(d.downtime_hours) AS total_downtime_hours
FROM plants p
LEFT JOIN downtime_logs d ON p.plant_id = d.plant_id
GROUP BY p.plant_id
ORDER BY total_downtime_hours DESC;
			
*/ Tagoloan Hydro has the highest total downtime at 70.89 hours, followed by Magat Hydro (62.7), and Balayan Thermal (61.84).
This confirms the pattern from earlier:
1) Tagoloan had the highest maintenance cost
2) The least energy per dollar
3) And now, the most downtime
Shifting the narrative:
1) Tagoloan may not be wasting money when it runs.
2) Instead, it might not be running enough — potentially due to asset failure, delays in repairs, or other availability issues.
Note: It doesn't fall under inefficiency because inefficiency means the plant is running but is doing a bad job converting inputs to outputs */


-- Query 4: Trend of Maintenance Frequency Over time
-- To analyze how often each plant undergoes maintenance — particularly Tagoloan Hydro — and identify if there’s a rising trend.
-- This helps detect chronic reliability issues when we can’t access root cause data.

SELECT
  strftime('%Y-%m', m.date) AS month,
  p.plant_name,
  COUNT(*) AS maintenance_events
FROM
  maintenance_logs m
JOIN
  plants p ON m.plant_id = p.plant_id
GROUP BY
  month, p.plant_name
ORDER BY
  month ASC, p.plant_name ASC;

*/ Balayan Thermal recorded the highest number of maintenance events in January — 5 in a single month
— but that dropped sharply afterward, suggesting a possible one-time maintenance sweep.
In contrast, Tagoloan Hydro shows a rising trend, with maintenance events increasing from 1 in January to 4 in February and 3 in March.
This consistent climb suggests the plant may be facing chronic reliability issues —
possibly due to aging equipment, recurring faults, or delays in resolving root causes.
If we link this with earlier findings (high cost, decent output, and notable downtime), then maintenance frequency may be a key stress signal
— pointing to availability challenges rather than sheer inefficiency. */

-- Query 5: Energy Lost per Hour of Downtime
-- Measures how much energy is lost for every hour a plant is unavailable
-- Helps reveal the true cost of unavailability for each plant

SELECT 
    p.plant_name,
    ROUND(SUM(o.energy_generated_mwh) * 1.0 / SUM(d.downtime_hours), 2) AS energy_generated_per_downtime_hour
FROM downtime_logs d
JOIN output_logs o 
    ON d.plant_id = o.plant_id AND d.date = o.date
JOIN plants p 
    ON d.plant_id = p.plant_id
GROUP BY p.plant_name
ORDER BY energy_generated_per_downtime_hour DESC;

*/ Magat Hydro and Balayan Thermal lead in energy generated per hour of downtime — 210.74 and 196.92 MWh, respectively
 — while Tagoloan Hydro lags at 166.75 MWh. This confirms that every hour of downtime at Tagoloan costs more than it should,
 considering its relatively low energy yield. When paired with its high maintenance costs and frequent downtimes,
 Whether that’s aging infrastructure, slow repairs, or systemic inefficiencies, downtime at Tagoloan isn’t just frequent — it’s expensive. */ 

	
-- --------------------------------------------------------
-- Final Insight Summary (Wrap-Up)
-- --------------------------------------------------------
-- Tagoloan Hydro had the highest maintenance spend.
-- But despite that, it generated the least energy per dollar.
-- It also suffered the most downtime and had frequent maintenance events.
-- Finally, every hour of downtime for Tagoloan cost more energy than other plants.
-- Altogether, this points to potential systemic inefficiency, aging infrastructure,
-- or poor asset availability.
-- Further investigation should prioritize:
-- (1) root causes of downtime, (2) repair lag, and (3) cost control measures.





