Project Title--

Analyzing Collision Avoidance Failures in Autonomous Driving Scenarios


Background--

Autonomous vehicles must continuously detect surrounding objects and make rapid braking decisions to prevent collisions. While braking systems are designed to activate when collision risk is detected, avoidance is not always successful. Understanding when and why braking fails is critical for improving vehicle safety and decision-making algorithms.


Problem Statement--

This project analyzes simulated autonomous driving collision scenarios to identify high-risk object and speed combinations where braking is triggered but collision avoidance fails. The goal is to uncover patterns that can help prioritize safety improvements.


Dataset Description--

The dataset consists of 10,000 simulated collision scenarios, each representing an interaction between an autonomous vehicle and an external object.

Key features include:

Object Type (Car, Motorcycle, Bike, Pedestrian, Truck, Animal)

Object Speed (km/h)

Time to Collision (seconds)

Braking Triggered (Boolean)

Collision Avoided (Boolean)

The dataset was synthetically generated to mimic real-world collision avoidance testing scenarios.


Business Questions--

This analysis focuses on answering the following questions:

Which object–speed combinations pose the highest collision risk?

Are braking failures driven by high scenario volume or high failure rate?

How does time-to-collision impact braking success?

Which scenarios should be prioritized for safety intervention?


Key Metrics--

The following metrics are used to evaluate system performance:

Collision Avoidance Rate (%)

Braking Success Rate (%)

High-Risk Scenario Percentage (TTC < 2 seconds)

Failed Braking Cases (count)


Initial Insights--

Early analysis reveals that motorcycles at medium speeds exhibit the highest braking failure rates. This indicates a potential detection and timing gap, rather than a pure speed-based risk. In contrast, very high-speed car collisions show expected physical limitations.


Tools Used--

SQL – Data aggregation, failure analysis, ranking

Python (Pandas) – Dataset generation and preprocessing

Power BI – Data visualization and dashboard creation
