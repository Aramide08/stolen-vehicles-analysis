USE stolen_vehicles_db;

-- Which regions or cities experience the most vehicle thefts?

-- Top 3 regions by theft count
SELECT region,COUNT(*) AS theft_count
FROM locations l
LEFT JOIN stolen_vehicles sv
ON l.location_id = sv.location_id
GROUP BY region
ORDER BY theft_count DESC
LIMIT 3;

-- Top 3 regions by theft count and population
SELECT region, COUNT(*) AS theft_count, population
FROM locations l
LEFT JOIN stolen_vehicles sv
ON l.location_id = sv.location_id
GROUP BY region, population
ORDER BY theft_count DESC
LIMIT 3;

-- How do vehicle theft patterns vary by day and month across 2021 and 2022? Are there peak periods law enforcement should pay attention to?

-- Monthly Trends by Year

SELECT 
	MONTHNAME(date_stolen) AS month_stolen, 
    YEAR(date_stolen) AS year_stolen,
    COUNT(vehicle_id) AS theft_count
FROM stolen_vehicles
GROUP BY year_stolen, month_stolen
ORDER BY theft_count DESC
LIMIT 10;

-- Year Count

SELECT 
	YEAR(date_stolen) AS Year_stolen, 
    COUNT(vehicle_id) AS theft_count
FROM stolen_vehicles
GROUP BY Year_stolen
ORDER BY theft_count DESC;

-- What are the most commonly stolen vehicle types, makes, and model years?

-- Top stolen makes
SELECT 
  make_name,
  COUNT(*) AS theft_count
FROM make_details md
JOIN stolen_vehicles sv ON md.make_id = sv.make_id
GROUP BY md.make_name
ORDER BY theft_count DESC
LIMIT 10;

-- Top vehicle types
SELECT 
  vehicle_type,
  COUNT(*) AS theft_count
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY theft_count DESC
LIMIT 5;

-- Top stolen model year
SELECT 
	model_year,
    COUNT(vehicle_id) AS theft_count
FROM stolen_vehicles
GROUP BY model_year
ORDER BY theft_count DESC
LIMIT 10;


-- Most stolen colors
SELECT 
  color, 
  COUNT(*) AS theft_count
FROM stolen_vehicles
GROUP BY color
ORDER BY theft_count DESC
LIMIT 5;

-- What is the relationship between location, population density, and theft rates?

SELECT 
    region, 
    ROUND(AVG(population),0) AS avg_population, 
    ROUND(AVG(density), 0) AS avg_density, 
    COUNT(vehicle_id) AS theft_count
FROM locations l
JOIN stolen_vehicles sv ON l.location_id = sv.location_id
GROUP BY region
ORDER BY theft_count DESC;


SELECT make_name, COUNT(vehicle_id) as total
FROM make_details md
JOIN stolen_vehicles sv ON md.make_id = sv.make_id
GROUP BY make_name
ORDER BY total DESC;







 
 
    
    
  
 
    
    
    
    
    
