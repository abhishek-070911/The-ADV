/*
Purpose:
Prioritize collision scenarios by combining failure rate
with object speed characteristics.

Failure rate is used instead of raw failure count
to avoid bias from high-volume scenarios.
*/

WITH speed_bucketed AS(
  SELECT
      object_type,
      CASE
          WHEN object_speed_kmph < 20 THEN 'Very Low'
          WHEN object_speed_kmph >= 20 AND object_speed_kmph < 40 THEN 'Low'
          WHEN object_speed_kmph >= 40 AND object_speed_kmph < 60 THEN 'Medium'
          WHEN object_speed_kmph >= 60 AND object_speed_kmph < 80 THEN 'High'
          ELSE 'Very High'
      END AS speed_bucket,
      collision_avoided
  FROM autonomous_collision_analysis_dataset
  WHERE braking_triggered = 1
  )

SELECT
      object_type,
      speed_bucket,
      COUNT(*) AS total_cases,
      SUM(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END) AS failed_cases,
      ROUND(AVG(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END )*100,2) AS failure_rate_percent,
      RANK() OVER(ORDER BY AVG(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END) DESC) AS risk_priority_rank
      FROM speed_bucketed
      GROUP BY object_type, speed_bucket
      ORDER BY risk_priority_rank;
