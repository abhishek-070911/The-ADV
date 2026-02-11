/*
Purpose:
Analyze braking performance once braking is triggered.
Focus is on identifying scenarios where braking failed
to prevent a collision.
*/

SELECT
    object_type,
    COUNT(*) AS braking_triggered_cases,
    SUM(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END) AS failed_braking_cases,
    ROUND(AVG(CASE WHEN collision_avoided = 0 THEN 1 ELSE 0 END)*100,2) AS failure_percent,
FROM autonomous_collision_analysis_dataset
WHERE braking_triggered = 1
GROUP BY object_type
ORDER BY failure_percent DESC;
    
