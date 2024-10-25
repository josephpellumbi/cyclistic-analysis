#1 specify the database and show the tables involved
USE trip_data;
SHOW TABLES;

#2 test to see if the records are imported correctly
SELECT *
FROM combined_file
LIMIT 5;

#3 changing column types for analysis
ALTER TABLE combined_file
MODIFY started_at TIMESTAMP,
MODIFY ended_at TIMESTAMP,
MODIFY ride_id VARCHAR(255),
MODIFY rideable_type VARCHAR(255),
MODIFY start_station_name VARCHAR(255),
MODIFY start_station_id VARCHAR(255),
MODIFY end_station_name VARCHAR(255),
MODIFY end_station_id VARCHAR(255),
MODIFY member_casual VARCHAR(255);

#4 adding columns: day of the week

ALTER TABLE combined_file
ADD COLUMN day_of_week INT;

SET SQL_SAFE_UPDATES = 0; 
-- need this code to run the "UPDATE" code below
-- set this to 0 to turn it off, and 1 to turn it back on

UPDATE combined_file
SET day_of_week = DAYOFWEEK(started_at);

-- test to see if it works
SELECT started_at, day_of_week
FROM combined_file
LIMIT 10;


-- add in a month column
ALTER TABLE combined_file
ADD COLUMN month_of_ride VARCHAR(20);

-- need this code to run the "UPDATE" code below
-- set this to 0 to turn it off, and 1 to turn it back on
SET SQL_SAFE_UPDATES = 1;
UPDATE combined_file
SET month_of_ride = DATE_FORMAT(started_at, '%M');

-- test to see if it works
SELECT started_at, month_of_ride
FROM combined_file
LIMIT 10;


-- add a column for ride_length
ALTER TABLE combined_file
ADD COLUMN ride_length VARCHAR(20);

-- need this code to run the "UPDATE" code below
-- set this to 0 to turn it off, and 1 to turn it back on
SET SQL_SAFE_UPDATES = 0;
UPDATE combined_file
SET ride_length = CONCAT(
	FLOOR(TIMESTAMPDIFF(SECOND, started_at, ended_at) / 3600), ':',
    LPAD(FLOOR((TIMESTAMPDIFF(SECOND, started_at, ended_at) % 3600) / 60), 2, '0'), ':',
    LPAD(TIMESTAMPDIFF(SECOND, started_at, ended_at) % 60, 2, '0')
)
WHERE TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0;

-- test to see if it works
SELECT started_at, ended_at, ride_length
FROM combined_file
LIMIT 10;

-- checking column types
DESC combined_file;

-- checking for duplicates
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id)
AS duplicate_rows
FROM combined_file;

-- 171 duplicates in combined_file
-- 121 duplicates in cyclistic
-- removed these duplicates in Python due to issues



#5 checking the number of nulls in each column
-- ran each column individually to make sure, kept those with nulls as individual queries

SELECT COUNT(*)
FROM combined_file
WHERE ride_id IS NULL OR ride_id = ""
OR rideable_type IS NULL OR rideable_type = ""
OR started_at IS NULL
OR ended_at IS NULL;
-- 0 nulls here/records with ""

SELECT COUNT(*)
FROM combined_file
WHERE start_station_name IS NULL OR start_station_name = "";
-- 968,697 records with ""

SELECT COUNT(*)
FROM combined_file
WHERE start_station_id IS NULL OR start_station_id = "";
-- 968,697 records with ""

SELECT COUNT(*)
FROM combined_file
WHERE end_station_name IS NULL OR end_station_name = "";
-- 998,607 records with ""

SELECT COUNT(*)
FROM combined_file
WHERE end_station_id IS NULL OR end_station_id = "";
-- 998,607 records with ""

SELECT COUNT(*)
FROM combined_file
WHERE start_lat IS NULL OR start_lat = ""
OR start_lng IS NULL OR start_lng = ""
OR end_lat IS NULL OR end_lat = ""
OR end_lng IS NULL OR end_lng = ""
OR member_casual IS NULL OR member_casual = "";
-- 0 nulls/records with ""

# 6 creating a copy of the combined_file for cleaning and data analysis

CREATE TABLE cyclistic AS
SELECT *
FROM combined_file;

# 7 deleting null values

SET SQL_SAFE_UPDATES = 0; 
-- need this code to run the "DELETE FROM" code below
-- set this to 0 to turn it off, and 1 to turn it back on

DELETE FROM cyclistic
WHERE ride_id = ''
   OR rideable_type = ''
   OR start_station_name = ''
   OR start_station_id = ''
   OR end_station_name = ''
   OR end_station_id = ''
   OR member_casual = '';
   