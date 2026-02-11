/* 
Purpose:
High-level exploration of autonomous vehicle collision scenarios
to understand object distribution and scenario volume.

This step helps separate high-frequency scenarios from high-risk scenarios.
*/

SELECT
    object_type,
    COUNT(*) AS total_scenarios
FROM autonomous_collision_analysis_dataset
GROUP BY object_type
ORDER BY total_scenarios DESC;
