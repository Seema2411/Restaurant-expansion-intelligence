---Exploratory Data Analysis (EDA)
DROP TABLE IF EXISTS zomato_clean;
--Create the Cleaned Table
CREATE TABLE zomato_clean AS
SELECT
    restaurant_name,
    restaurant_type,
    CAST(rate AS NUMERIC(2,1)) AS rating,
    CAST(num_of_ratings AS INTEGER) AS num_of_ratings,
    CAST(avg_cost_two_people AS INTEGER) AS avg_cost_two_people,
    online_order,
    table_booking,
    cuisines_type,
    area,
    local_address
FROM zomato
WHERE rate IS NOT NULL
  AND avg_cost_two_people IS NOT NULL;

--verify the table
SELECT *
FROM zomato_clean
LIMIT 10;

--KPI Cards
-- Total Restaurants
SELECT COUNT(*) AS total_restaurants
FROM zomato_clean;

-- Average Rating
SELECT ROUND(AVG(rating),2) AS average_rating
FROM zomato_clean;

-- Average Cost for Two
SELECT ROUND(AVG(avg_cost_two_people),0) AS average_cost
FROM zomato_clean;

-- Total Areas
SELECT COUNT(DISTINCT area) AS total_areas
FROM zomato_clean;

-- Total Cuisine Types
SELECT COUNT(DISTINCT cuisines_type) AS total_cuisines
FROM zomato_clean;

--Restaurant Analysis--
--Top 10 Highest Rated Restaurants
SELECT
restaurant_name,
rating,
num_of_ratings
FROM zomato_clean
ORDER BY rating DESC, num_of_ratings DESC
LIMIT 10;
--Top 10 Most Reviewed Restaurants
SELECT
restaurant_name,
num_of_ratings
FROM zomato_clean
ORDER BY num_of_ratings DESC
LIMIT 10;
--Rating Distribution
SELECT
rating,
COUNT(*) AS total_restaurants
FROM zomato_clean
GROUP BY rating
ORDER BY rating;

--Cuisine Analysis--
--Most Popular Cuisines
SELECT
cuisines_type,
COUNT(*) AS total_restaurants
FROM zomato_clean
GROUP BY cuisines_type
ORDER BY total_restaurants DESC
LIMIT 15;
--Highest Rated Cuisines
SELECT
cuisines_type,
ROUND(AVG(rating),2) AS avg_rating
FROM zomato_clean
GROUP BY cuisines_type
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC
LIMIT 15;

--Area Analysis--
--Areas with Most Restaurants
SELECT
area,
COUNT(*) AS restaurant_count
FROM zomato_clean
GROUP BY area
ORDER BY restaurant_count DESC
LIMIT 15;
--Highest Rated Areas
SELECT
area,
ROUND(AVG(rating),2) AS average_rating
FROM zomato_clean
GROUP BY area
HAVING COUNT(*) >= 10
ORDER BY average_rating DESC
LIMIT 15;
--Most Expensive Areas
SELECT
area,
ROUND(AVG(avg_cost_two_people),0) AS average_cost
FROM zomato_clean
GROUP BY area
ORDER BY average_cost DESC
LIMIT 15;

--Online Ordering Analysis--
--Online Order Availability
SELECT
online_order,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY online_order;
--Online Order vs Rating
SELECT
online_order,
ROUND(AVG(rating),2) AS average_rating
FROM zomato_clean
GROUP BY online_order;

--Table Booking Analysis--
--Table Booking Availability
SELECT
table_booking,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY table_booking;
--Table Booking vs Rating
SELECT
table_booking,
ROUND(AVG(rating),2) AS average_rating
FROM zomato_clean
GROUP BY table_booking;

--Cost Analysis--
--Cost Categories
SELECT
CASE
    WHEN avg_cost_two_people < 500 THEN 'Budget'
    WHEN avg_cost_two_people BETWEEN 500 AND 1000 THEN 'Mid Range'
    ELSE 'Premium'
END AS cost_category,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY cost_category;
--Premium Restaurants
SELECT
restaurant_name,
area,
avg_cost_two_people,
rating
FROM zomato_clean
ORDER BY avg_cost_two_people DESC
LIMIT 10;
--Best Value Restaurants
SELECT
restaurant_name,
rating,
avg_cost_two_people
FROM zomato_clean
WHERE avg_cost_two_people < 500
ORDER BY rating DESC
LIMIT 10;
