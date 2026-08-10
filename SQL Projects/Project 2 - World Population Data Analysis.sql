use world;
SELECT * FROM country;

-- 1. Display the Name, Continent, and Population of all countries located in Asia.
SELECT Name,Continent,Population
FROM country
WHERE Continent = 'Asia';

-- 2. Display the Name, Population, and LifeExpectancy of all countries.
--    Sort the results by Population in descending order.
SELECT Name,Population,LifeExpectancy
FROM country
ORDER BY Population DESC;

-- 3. Display the Name, Continent, and Population of countries that:
--    belong to Europe, AND have a population greater than 20,000,000.
--    Sort the results alphabetically by country name.
SELECT Name,Continent,Population
FROM country
WHERE Continent = 'Europe' AND Population > 20000000
ORDER BY Name ASC;

-- 4. Display the Name, Region, and SurfaceArea of countries that are located in either
--    North America, OR South America. Sort the results by region.
SELECT Name,Region,SurfaceArea 
FROM country
WHERE Continent = 'Europe' OR Continent = 'South America'
ORDER BY Region;

-- 5. Display the Name, Continent, and Population of all countries that are NOT located in Asia.
--    Sort the results by country name.
SELECT Name,Continent,Population
FROM country
WHERE Continent != 'Asia'
ORDER BY Name;

SELECT Name, Continent,Population
FROM country
WHERE Continent NOT IN ('Asia')
ORDER BY Name;

-- 6. Display the Name, Population, and GovernmentForm of countries whose population is
--    between 5,000,000 and 30,000,000.
--    Sort the results by population.
SELECT Name,Population,GovernmentForm 
FROM country
WHERE Population BETWEEN 5000000 AND 30000000
ORDER BY Population;

SELECT Name,Population,GovernmentForm 
FROM country
WHERE Population >= 5000000 
AND Population <= 30000000
ORDER BY Population;

-- 7. Display the Name, Capital, and Population of countries whose continent is one of
--    Asia, Africa, or Europe.
--    Sort the results alphabetically by country name.
SELECT Name,Capital,Population
FROM country
WHERE Continent IN ('Asia','Africa','Europe')
ORDER BY Name ASC;

SELECT Name,Capital,Population
FROM country
WHERE Continent = 'Asia' OR Continent ='Africa' OR Continent ='Europe'
ORDER BY Name ASC;

-- 8. Display the Name, Region, and Population of countries whose names start with the
--    letter 'A'.
--    Sort the results alphabetically.
SELECT Name,Region,Population
FROM country
WHERE Name like 'A%'
ORDER BY Name;

-- 9. Display the Name, Continent, Population, and LifeExpectancy of countries that:
--    are in Asia OR Europe,
--    have a population greater than 50,000,000, AND
--    have a life expectancy greater than 70.
--    Sort the results by population in descending order.
SELECT Name, Continent, Population,LifeExpectancy
FROM country
WHERE Continent IN('Asia','Europe') 
	AND Population > 50000000 
	AND LifeExpectancy > 70 
ORDER BY Population DESC;

-- 10. Display the Name, Continent, Population, and GovernmentForm of countries that
--     are NOT in Africa, have a population between 5,000,000 and 30,000,000,
--     and whose names contain the letter 'land'.
--     Sort the results alphabetically.
SELECT Name, Continent, Population,GovernmentForm
FROM country
WHERE Continent NOT IN ('Africa') 
	AND Population BETWEEN 5000000 AND 30000000 
	AND Name LIKE '%land%' 
ORDER BY Name;


