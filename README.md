# cyclistic-analysis
Google Data Analytics Capstone Case Study

<img width="277" alt="image" src="https://github.com/user-attachments/assets/b4af86b8-61df-4d37-973e-b93c8b371c47">

Cyclistic: An in-depth analysis focused on casual rider and annual member behaviors

---

## 1. Executive Summary
•	Company Overview: Cyclistic is a fictional bike-share company in Chicago which features more than 5800 bicycles and 600 docking stations. 

•	Objective of the Analysis: The marketing analyst team at Cyclistic wants to understand how casual riders and annual members use Cyclistic bikes differently so that a new marketing strategy can be created to convert casuals into members. However, the Cyclistic executives must approve the recommendations first, so the recommendations must be backed up with compelling data insights and professional data visualizations.

•	Key Findings:
1.	Member vs. Casual Rider Usage: Members accounted for 67% of the total rides and exhibited consistent usage patterns throughout the week, particularly during commute hours. Casual riders showed a preference for weekends, with a noticeable increase in ride frequency and length during the warmer months.

2.	Bike Preferences: Members frequently used both classic and electric bikes, while casual riders tended to flavor classic bikes, though they spent more time on electric bikes, especially on weekends.

3.	Seasonality of Rides: Ride volume for both members and casual riders spiked during spring and summer, highlighting a clear seasonal pattern in Cyclistic’s usage.

4.	Ride Duration: Casual riders consistently had longer ride durations compared to members, especially on weekends, aligning with their more leisure-focused use.

•	Recommendations:
1.	Seasonal Campaigns: Launch targeted membership promotions in spring and summer when casual rider activity is at its peak. Highlight the value of membership for long-duration riders and offer off-season discounts to boost membership during slower periods.

2.	Weekend-Focused Offers: Introduce weekend-specific promotions to attract casual riders, offering incentives such as free weekend rides with membership. Emphasize the benefits of unlimited rides for longer trips.

3.	Electric Bike Promotions: Develop campaigns to encourage casual riders to try electric bikes, offering initial discounts or free electric bike use with a membership. Highlight the time-saving benefits, particularly for commuting.

4.	Tiered Memberships: Introduce tiered membership plans tailored to specific rider needs, such as a weekend membership for leisure users or a commuter plan for regular weekday riders.

---

## 2. Introduction


•	Background of the Company: In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 

It sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.
 
•	Purpose of the Case Study: Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Lily Moreno (the director of marketing) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. 

---

## 3. Data Collection and Methodology
•	Data Sources: Cyclistic’s historical trip data was sourced from a publicly available dataset.

(Note: Though the data represents a factional company, it is appropriate for addressing the business questions at hand. The data has been made available under a license by Motivate International Inc.) 

•	Data Period: The analysis covers data from September 2023 to August 2024.

•	Tools and Techniques Used: Data exploration and analysis were conducted using a combination of Microsoft Excel, Python, MySQL, and Tableau for visualizations.

•	Limitations: Due to data privacy constraints, personally identifiable information was excluded from the dataset. This limited the ability to directly connect pass purchases to specific users or determine riders’ exact locations.

---

## 4. Data Exploration & Cleaning in Excel
•	Data Observations:
1.	Each month’s dataset contained 13 key variables with trip details like: ‘ride_id’, ‘rideable_type’, ‘started_at’, ‘ended_at’, ‘start_station_name’, ‘start_station_id’, ‘end_station_name’, ‘end_station_id’, ‘start_lat’, ‘start_lng’, ‘end_lat’, ‘end_lng’, ‘member_casual’
   
2.	Two additional columns, ‘ride_length’ and ‘day_of_week’, were created to support the analysis of trip durations and weekday patterns.
   
•	Cleaning:
1.	Ride lengths were calculated by subtracting the start time from the end time of each trip.
   
2.	The ‘day_of_week’ column was created to categorize trips by the day they occurred.
   
•	Pivot Table Analysis:
1.	Averages of ride lengths for members and casuals were calculated for each month.

2.	The total number of rides was broken down by day of the week to identify peak usage periods.

---

## 5. Data Combining
•	Tool Used: Python was used to combine 12 individual .csv files, each representing a month’s worth of data, into a single dataset named “combined_file” containing over 5.6 million rows.

•	The combined dataset was then uploaded into MySQL for further exploration and cleaning.

---

## 6. Data Cleaning
•	Cleaning Process:
1.	Column types were standardized to ensure consistency across the dataset.

2.	Additional columns such as ‘day_of_week’, ‘month_of_ride’, and ‘ride_length’ were created to facilitate analysis.

3.	Duplicates were identified and removed, reducing the dataset to 4.1 million rows after cleaning.

---

## 7. Data Analysis
•	Trip Analysis:
1.	The total number of trips was categorized by bike type (classic vs. electric) and by rider type (members vs. casuals). 

2.	The longest trip recorded was 25 hours and 9 minutes, though average ride lengths were considerably shorter.

•	Ride Times:
1.	The overall average ride time was calculated at 16.34 minutes, with separate analyses conducted for each month and rider type. 

2.	Seasonal patterns were identified, with ride times peaking during warmer months, particularly for casual riders.

---

## 8. Data Visualization
•	Tool used: Tableau was employed to create interactive dashboards highlighting key patterns in Cyclistic’s usage data.

•	Dashboards:
1.	Classic vs. Electric Bikes: Visualized the proportion of rides by bike type, with detailed comparisons of average ride lengths per rider type and day of the week.

<img width="468" alt="image" src="https://github.com/user-attachments/assets/c3a957d7-2327-4d8f-bc98-ec8042727d89">

2.	Total Rides Comparison: Illustrated total ride counts broken down by cyclist type, month, day of the week, and hour of the day.

<img width="468" alt="image" src="https://github.com/user-attachments/assets/32acd5c8-f363-447e-96e9-9534879973f3">

3.	Average Ride Lengths: Compared the average ride durations for members and casual riders across various time frames.

<img width="468" alt="image" src="https://github.com/user-attachments/assets/0c890746-5cdf-49a5-8cce-87479c7731f1">

---

## 9. Key Insights
•	Classic vs. Electric: 
1. Members account for the majority of rides, with consistent usage across both classic and electric bikes.
2. Casual riders favor classic bikes but tend to ride electric bikes for longer durations, particularly on weekends.
3. Ride lengths for casual riders increase significantly after the winter months, reflecting a seasonal trend. 

•	Ride Behavior:
1. Members primarily use bikes for commuting, with peak rides occurring on weekdays, especially Wednesdays.
2. Casual riders’ trips are concentrated on weekends, indicating a preference for leisure activities.
3. Members’ peak ride times align with typical commuting hours, while casual riders show a more gradual increase throughout the day, peaking in the afternoon.

•	Average Bike Ride Length:
1. Casual riders consistently have longer ride times compared to members, especially on weekends and in warmer months.
2. Ride lengths for casual riders peak in spring and summer, suggesting increased engagement during these periods.

---

## 10. Recommendations
Seasonal Promotions: 
1. Leverage the increased engagement of casual riders in spring and summer by offering membership discounts and incentives for longer-term usage.
2. Introduce off-season membership discounts to maintain engagement during colder months.

Weekend–Focused Offers:
1. Develop weekend-specific promotions aimed at converting casual riders to members, emphasizing unlimited rides and cost savings.
2. Tailor marketing messages to highlight the benefits of longer ride durations available to members.

Electric Bike Promotions:
1. Offer discounts or free trials for casual riders to encourage electric bike usage, with a focus on the convenience and time-saving benefits of membership.

Tiered Membership Plans: 
1. Introduce flexible membership plans, such as a weekend membership for leisure riders or a commuter-focused option for weekday users, to appeal to different rider segments.

## 11. Conclusion
•	Summary of Key Points: Cyclistic’s bike-share data reveals clear distinctions between casual riders and members, with opportunities to boost membership through targeted promotions and tailored marketing strategies. The key to Cyclistic’s future growth lies in converting casual riders into loyal members by leveraging seasonal patterns and promoting membership benefits.

•	Final Thoughts: By aligning marketing strategies with rider behavior, Cyclistic can enhance customer retention, increase membership rates, and capitalize on growing market trends in the bike-sharing industry.

•	Call to Action: Implementing these data-driven recommendations will ensure Cyclistic’s continued success in an increasingly competitive market, while fostering a larger and more engaged member base.
