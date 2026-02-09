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

Identification of object–speed combinations with braking failures

Risk Prioritization

Failure rate–based ranking to separate high-risk scenarios from high-volume scenarios


Key Insights--

  * Motorcycles at medium speeds showed the highest braking failure rates
    
  * Very high-speed car collisions reflected expected physical limitations.

  * Risk was driven more by failure rate than scenario volume.

Outcome--

  The analysis enables prioritization of high-risk scenarios for safety system improvement and monitoring.
