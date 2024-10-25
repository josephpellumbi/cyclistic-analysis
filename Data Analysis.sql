#1 specify the database and show the tables involved
USE trip_data;
SHOW TABLES;

# 2 data exploration and analysis

-- total number of rows: 4,143,123
SELECT COUNT(*)
FROM cyclistic;

-- number of distinct rider_ids: 4,143,002
SELECT COUNT(DISTINCT ride_id)
FROM cyclistic;

-- this means we need to delete 121 of the rows in the dataset. Removed in Python

-- types of bicycles and number of trips made using each type
SELECT 
	DISTINCT(rideable_type),
    COUNT(*) AS number_of_trips
FROM cyclistic
GROUP BY rideable_type
ORDER BY number_of_trips DESC;

-- number of trips made by members vs casuals
SELECT 
	DISTINCT(member_casual),
    COUNT(*) AS number_of_trips
FROM cyclistic
GROUP BY member_casual
ORDER BY number_of_trips DESC;

-- maximum ride time
SELECT 
   TIMESTAMPDIFF(MINUTE, started_at, ended_at) AS max_ride_time_in_minutes,
   TIMESTAMPDIFF(MINUTE, started_at, ended_at) DIV 60 AS hours,
   TIMESTAMPDIFF(MINUTE, started_at, ended_at) % 60 AS minutes
FROM cyclistic
ORDER BY max_ride_time_in_minutes DESC
LIMIT 1;

-- average ride time
SELECT
	AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_time_minutes
FROM cyclistic
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0; -- ensures valid ride times (no negatives/mistakes)

-- average ride time each month
SELECT
	DATE_FORMAT(started_at, '%Y-%m') AS ride_month,
    AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_time_minutes
FROM cyclistic
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0 -- ensures valid ride times (no negatives/mistakes)
GROUP BY ride_month
ORDER BY ride_month ASC;

-- average ride time for members/casuals
SELECT
	member_casual,
	AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_time_minutes
FROM cyclistic
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0 -- ensures valid ride times (no negatives/mistakes)
GROUP BY member_casual;

-- average ride time for each bike type
SELECT
	rideable_type,
	AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_time_minutes
FROM cyclistic
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0 -- ensures valid ride times (no negatives/mistakes)
GROUP BY rideable_type;

-- average ride time for members/casuals on each type of bike
SELECT
	member_casual,
	rideable_type,
	AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_time_minutes
FROM cyclistic
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0 -- ensures valid ride times (no negatives/mistakes)
GROUP BY member_casual, rideable_type;

-- average ride time per month for members/casuals on each type of bike
SELECT
	member_casual,
	rideable_type,
    month_of_ride,
	AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_time_minutes
FROM cyclistic
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0 -- ensures valid ride times (no negatives/mistakes)
GROUP BY member_casual, rideable_type, month_of_ride
ORDER BY month_of_ride;