CREATE DATABASE llin_analysis;
USE llin_analysis;

CREATE TABLE llin_distribution (
    ID INT PRIMARY KEY,  
    Number_distributed INT,
    Location TEXT,
    Country TEXT,                
    Year INT,                
   By_whom TEXT,              
   Country_code TEXT
   );
   
   SELECT * from llin_distribution;
   
   -- Calculate the total number of LLINs distributed in each country
   
   SELECT SUM(Number_distributed),
   Country
   FROM llin_distribution
   GROUP BY COUNTRY;
   
   -- Find the average number of LLINs distributed per distribution event
   
   SELECT AVG(Number_distributed)
    FROM llin_distribution;
    
    -- Determine the earliest and latest distribution dates in the dataset.
    
    SELECT 
    MIN(Year) AS earliest_date,
    MAX(Year) AS latest_date
FROM llin_distribution;

-- Identify the total number of LLINs distributed by each organization
    
    SELECT SUM(Number_distributed),
   By_whom
   FROM llin_distribution
   GROUP BY By_whom;
   
    -- Calculate the total number of LLINs distributed in each year
   
   SELECT SUM(Number_distributed),
   Year
   FROM llin_distribution
   GROUP BY YEAR;

-- Locations with the highest and lowest number of LLINs distributed.

SELECT SUM(Number_distributed),
   Location
   FROM llin_distribution
   GROUP BY location
   ORDER BY SUM(Number_distributed) DESC;
   
    
-- Determine if there's a significant difference in the number of LLINs distributed by different organizations.
    
    SELECT sum(Number_distributed) count,
   STDDEV_POP(Number_distributed) as deviation,
   By_whom
   FROM llin_distribution
   GROUP BY By_whom;

 
