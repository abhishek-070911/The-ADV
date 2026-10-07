Project--
  Autonomous Vehicle Collision Avoidance Analysis


Overview--

  Autonomous vehicles must detect surrounding objects and initiate braking decisions within limited time windows to avoid collisions. While braking may be triggered, collision avoidance is not always successful.

This project analyzes collision avoidance performance using simulated autonomous driving scenarios to identify high-risk object and speed combinations where braking fails. The goal is to support risk prioritization and safety improvement through data-driven insights.


Dataset Description--

 The dataset consists of 10,000 simulated collision scenarios, designed to mimic autonomous vehicle safety testing data.Each record represents an interaction between an autonomous vehicle and an external object.

* Key Features

    * Scenario_id – Unique scenario identifier

    * Object_type – Car, Motorcycle, Bike, Pedestrian, Truck, Animal

    * Object_speed_kmph – Speed of the external object

    * Time_to_collision_sec – Estimated time before collision

    * Braking_triggered – Whether braking was initiated (Boolean)

    * Collision_avoided – Whether collision was successfully avoided (Boolean)


Business Questions--

This analysis focuses on answering the following questions:

  * Which object–speed combinations generate the highest braking failures?

  * Are failures driven by scenario volume or failure rate?

  * How does time-to-collision (TTC) impact braking success?

  * Which scenarios should be prioritized for safety improvement?


Key Metrics--

The following metrics were used to evaluate system performance:

  * Collision Avoidance Rate (%)

  * Braking Success Rate (%)

  * High-Risk Scenario Percentage (TTC < 2s)

  * Failed Braking Cases

  * Failure Rate (%) given braking triggered


Tools & Technologies--

  * SQL – Data aggregation, failure analysis, and risk ranking

  * Python (Pandas) – Synthetic dataset generation and preprocessing

  * Power BI – KPI tracking, failure heatmaps, and interactive dashboards


Analysis Approach--

1. Data Exploration

  * Object distribution and scenario frequency analysis

2.Performance Measurement

  * Collision avoidance and braking success rates

3.Failure Analysis

  * Identification of object–speed combinations with braking failures

4.Risk Prioritization

  * Failure rate–based ranking to separate high-risk scenarios from high-volume scenarios


Key Insights--

  * Raw failure counts track scenario volume, not risk: very-low-speed pedestrians and animals
    are 32.5% of braking cases and 32.4% of failures.

  * Failure rates stay between 35.8% and 49.7% across all 18 object-speed groups. The spread is
    noise (chi-square p = 0.35): the simulator decides outcomes from time-to-collision alone,
    so every group's expected failure rate is 42.9%.

  * Overall, 26.3% of scenarios avoided a collision, braking succeeded in 57.1% of triggered
    cases, and 19.8% of scenarios fell in the high-risk window (TTC < 2 s).

  * Takeaway: rank scenarios by failure rate, and test whether a difference between groups is
    real before acting on it.


Dashboard Highlights--

The Power BI dashboard includes:

  * KPI cards for system performance metrics

  * Matrix visualization of failed braking cases and failure rate by object type and speed bucket

  * Failure rate ranking to identify high-risk scenarios

  * TTC distribution to highlight critical time windows

  The dashboard reads all 10,000 scenarios from Data/autonomous_collision_analysis_dataset.csv. Power Query derives the speed bucket from Object_speed_kmph with the same cut-offs as the SQL (20, 40, 60 and 80 km/h).

Outcome--

  This analysis shows how structured SQL analysis and visualization separate scenario volume from risk, and why a difference between groups should be tested before it drives a safety decision. Because the data is simulated, with outcomes set by time-to-collision alone, it demonstrates the method rather than real-world risk.
