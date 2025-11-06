-- mysql_queries_d2e.sql

-- 1) Compute DFR, DUR, SLI per region-hour
WITH metrics AS (
  SELECT
    region,
    hour,
    completed_deliveries / NULLIF(total_requests, 0) AS dfr,
    active_delivery_time_minutes / NULLIF(logged_in_time_minutes, 0) AS dur,
    actual_eta_minutes / NULLIF(promised_eta_minutes, 0) AS sli
  FROM hourly_driver_demand
)
SELECT * FROM metrics;

-- 2) Average DDES by region (example weighting: 0.4 DFR, 0.4 DUR, 0.2 inverse SLI)
WITH metrics AS (
  SELECT
    region,
    hour,
    completed_deliveries / NULLIF(total_requests, 0) AS dfr,
    active_delivery_time_minutes / NULLIF(logged_in_time_minutes, 0) AS dur,
    actual_eta_minutes / NULLIF(promised_eta_minutes, 0) AS sli
  FROM hourly_driver_demand
),
ddes AS (
  SELECT
    region,
    AVG(0.4 * dfr + 0.4 * dur + 0.2 * (1 - sli)) AS ddes
  FROM metrics
  GROUP BY region
)
SELECT * FROM ddes ORDER BY ddes DESC;

-- 3) DFR heatmap helper: pivot-style aggregation
SELECT
  region,
  hour,
  ROUND(100 * completed_deliveries / NULLIF(total_requests, 0), 1) AS dfr_pct
FROM hourly_driver_demand
ORDER BY region, hour;

-- 4) Join with incentives to assess uplift potential
SELECT
  h.region,
  h.hour,
  completed_deliveries / NULLIF(total_requests, 0) AS dfr,
  i.incentive_multiplier
FROM hourly_driver_demand h
LEFT JOIN incentives i
  ON h.region = i.region AND h.hour = i.hour
ORDER BY h.region, h.hour;
