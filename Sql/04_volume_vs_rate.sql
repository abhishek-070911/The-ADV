/*
Purpose:
Check whether failure COUNTS reflect risk or just scenario volume,
then compare failure RATES across object-speed groups.

Important: the simulator (notebook/dataset_generation.ipynb) decides outcomes
from time_to_collision_sec only - braking if TTC <= 4 s, collision avoided if
TTC >= 2 s. Object type and speed have no effect, so every group has the same
expected failure rate: 1.5 / 3.5 = 42.9%. Differences between groups are noise
(chi-square test in the notebook: p = 0.35).
*/

/* ---------- 1. Headline KPIs on all 10,000 scenarios ---------- */
SELECT
    COUNT(*) AS scenarios,
    ROUND(100.0 * AVG(collision_avoided), 1) AS pct_scenarios_avoided,
    ROUND(100.0 * SUM(CASE WHEN braking_triggered = 1 AND collision_avoided = 1 THEN 1 ELSE 0 END)
                / SUM(braking_triggered), 1) AS braking_success_pct,
    ROUND(100.0 * AVG(CASE WHEN time_to_collision_sec < 2 THEN 1 ELSE 0 END), 1) AS pct_ttc_under_2s
FROM autonomous_collision_analysis_dataset;
-- Expected: 10,000 | 26.3 | 57.1 | 19.8


/* ---------- 2. Share of cases vs share of failures, and failure rate, per group ---------- */
WITH braking AS (
    SELECT object_type,
           CASE
               WHEN object_speed_kmph < 20 THEN 'Very Low'
               WHEN object_speed_kmph < 40 THEN 'Low'
               WHEN object_speed_kmph < 60 THEN 'Medium'
               WHEN object_speed_kmph < 80 THEN 'High'
               ELSE 'Very High'
           END AS speed_bucket,
           collision_avoided
    FROM autonomous_collision_analysis_dataset
    WHERE braking_triggered = 1
),
grp AS (
    SELECT object_type, speed_bucket,
           COUNT(*) AS cases,
           SUM(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END) AS failed
    FROM braking
    GROUP BY object_type, speed_bucket
)
SELECT object_type, speed_bucket, cases, failed,
       ROUND(100.0 * cases / SUM(cases) OVER (), 1) AS pct_of_braking_cases,
       ROUND(100.0 * failed / SUM(failed) OVER (), 1) AS pct_of_failures,
       ROUND(100.0 * failed / cases, 1) AS failure_rate_pct
FROM grp
ORDER BY failed DESC;
-- Expected: 18 groups; failure rates from 35.8% to 49.7%.


/* ---------- 3. Very-low-speed pedestrians and animals together ---------- */
WITH braking AS (
    SELECT object_type, object_speed_kmph, collision_avoided
    FROM autonomous_collision_analysis_dataset
    WHERE braking_triggered = 1
)
SELECT
    ROUND(100.0 * SUM(CASE WHEN object_type IN ('Pedestrian', 'Animal') AND object_speed_kmph < 20 THEN 1 ELSE 0 END)
                / COUNT(*), 1) AS pct_of_braking_cases,
    ROUND(100.0 * SUM(CASE WHEN object_type IN ('Pedestrian', 'Animal') AND object_speed_kmph < 20 AND collision_avoided = 0 THEN 1 ELSE 0 END)
                / SUM(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END), 1) AS pct_of_failures
FROM braking;
-- Expected: 32.5% of braking cases and 32.4% of failures - counts follow volume.
