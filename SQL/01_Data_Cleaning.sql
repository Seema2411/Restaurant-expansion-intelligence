DROP TABLE IF EXISTS zomato;


CREATE TABLE public.zomato (
    restaurant_name TEXT,
    restaurant_type TEXT,
    rate TEXT,
    num_of_ratings TEXT,
    avg_cost_two_people TEXT,
    online_order TEXT,
    table_booking TEXT,
    cuisines_type TEXT,
    area TEXT,
    local_address TEXT
);
--Total Rows
SELECT COUNT(*) AS total_restaurants
FROM zomato;
--View First 10 Rows
SELECT *
FROM zomato
LIMIT 10;
--Check Table Structure
SELECT
column_name,
data_type
FROM information_schema.columns
WHERE table_name='zomato';
--Check for NULL values
SELECT
SUM(CASE WHEN restaurant_name IS NULL THEN 1 ELSE 0 END) AS restaurant_name_null,
SUM(CASE WHEN restaurant_type IS NULL THEN 1 ELSE 0 END) AS restaurant_type_null,
SUM(CASE WHEN rate IS NULL THEN 1 ELSE 0 END) AS rate_null,
SUM(CASE WHEN num_of_ratings IS NULL THEN 1 ELSE 0 END) AS ratings_null,
SUM(CASE WHEN avg_cost_two_people IS NULL THEN 1 ELSE 0 END) AS cost_null,
SUM(CASE WHEN cuisines_type IS NULL THEN 1 ELSE 0 END) AS cuisine_null,
SUM(CASE WHEN area IS NULL THEN 1 ELSE 0 END) AS area_null
FROM zomato;
--Find Duplicate Restaurants
SELECT
restaurant_name,
COUNT(*)
FROM zomato
GROUP BY restaurant_name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;
--Check Different Rating Values
SELECT DISTINCT rate
FROM zomato
ORDER BY rate;
--Check Average Cost Values
SELECT DISTINCT avg_cost_two_people
FROM zomato
LIMIT 20;
--Check Online Order Values
SELECT DISTINCT online_order
FROM zomato;
--Check Table Booking Values
SELECT DISTINCT table_booking
FROM zomato;
--Check Restaurant Types
SELECT DISTINCT restaurant_type
FROM zomato
ORDER BY restaurant_type;
--Check Cuisine Types
SELECT DISTINCT cuisines_type
FROM zomato
LIMIT 30;
--Check Missing Values
SELECT
COUNT(*) AS total_rows,
COUNT(restaurant_name) AS restaurant_name,
COUNT(restaurant_type) AS restaurant_type,
COUNT(rate) AS rate,
COUNT(num_of_ratings) AS num_of_ratings,
COUNT(avg_cost_two_people) AS avg_cost_two_people,
COUNT(online_order) AS online_order,
COUNT(table_booking) AS table_booking,
COUNT(cuisines_type) AS cuisines_type,
COUNT(area) AS area,
COUNT(local_address) AS local_address
FROM zomato;
--Check Cost Values
SELECT DISTINCT avg_cost_two_people
FROM zomato
ORDER BY avg_cost_two_people
LIMIT 30;


