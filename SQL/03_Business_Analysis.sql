--Question 1: Which Areas Have the Highest Restaurant Demand
SELECT
    area,
    COUNT(*) AS restaurant_count
FROM zomato_clean
GROUP BY area
ORDER BY restaurant_count DESC
LIMIT 15;

--Question 2: Which Areas Have Low Competition?
SELECT
    area,
    COUNT(*) AS restaurant_count
FROM zomato_clean
GROUP BY area
HAVING COUNT(*) BETWEEN 20 AND 80
ORDER BY restaurant_count;
--Question 3: Which Areas Have the Highest Customer Ratings?
SELECT
    area,
    ROUND(AVG(rating),2) AS avg_rating,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY area
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;
--Question 4: Which Cuisine Performs Best?
SELECT
    cuisines_type,
    ROUND(AVG(rating),2) AS avg_rating,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY cuisines_type
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;
--Question 5: High Demand + High Rating Cuisines
SELECT
    cuisines_type,
    COUNT(*) AS restaurants,
    ROUND(AVG(rating),2) AS avg_rating
FROM zomato_clean
GROUP BY cuisines_type
HAVING COUNT(*) >= 20
ORDER BY avg_rating DESC,
         restaurants DESC;
--Question 6: Best Cuisine in Each Area
SELECT
    area,
    cuisines_type,
    ROUND(AVG(rating),2) AS avg_rating,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY area, cuisines_type
HAVING COUNT(*) >= 5
ORDER BY area, avg_rating DESC;
--Question 7: Premium vs Budget Areas
SELECT
    area,
    ROUND(AVG(avg_cost_two_people),0) AS avg_cost
FROM zomato_clean
GROUP BY area
ORDER BY avg_cost DESC;
--Question 8: Does Online Ordering Increase Ratings?
SELECT
    online_order,
    ROUND(AVG(rating),2) AS avg_rating,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY online_order;
--Question 9: Does Table Booking Increase Ratings?
SELECT
    table_booking,
    ROUND(AVG(rating),2) AS avg_rating,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY table_booking;
--Question 10: Restaurant Density by Area
SELECT
    area,
    COUNT(*) AS density
FROM zomato_clean
GROUP BY area
ORDER BY density DESC;
--Question 11: Average Reviews by Area
SELECT
    area,
    ROUND(AVG(num_of_ratings),0) AS avg_reviews
FROM zomato_clean
GROUP BY area
ORDER BY avg_reviews DESC;
--Question 12: Opportunity Matrix
SELECT
    area,
    COUNT(*) AS restaurants,
    ROUND(AVG(rating),2) AS avg_rating
FROM zomato_clean
GROUP BY area
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC,
         restaurants ASC;
--Question 13: Create an Opportunity Score
SELECT
    area,
    COUNT(*) AS competition,
    ROUND(AVG(rating),2) AS avg_rating,
    ROUND(AVG(avg_cost_two_people),0) AS avg_cost,
    ROUND(AVG(num_of_ratings),0) AS avg_reviews
FROM zomato_clean
GROUP BY area;
--Question 14: Top Expansion Recommendations
SELECT
    area,
    ROUND(AVG(rating),2) AS avg_rating,
    COUNT(*) AS competition,
    ROUND(AVG(num_of_ratings),0) AS avg_reviews
FROM zomato_clean
GROUP BY area
HAVING COUNT(*) BETWEEN 20 AND 80
ORDER BY avg_rating DESC,
         avg_reviews DESC;
--Question 15: Recommended Cuisine by Area
SELECT
    area,
    cuisines_type,
    COUNT(*) AS restaurants,
    ROUND(AVG(rating),2) AS avg_rating
FROM zomato_clean
GROUP BY area, cuisines_type
HAVING COUNT(*) >= 5
ORDER BY area,
         avg_rating DESC;
restraurant_expansion
