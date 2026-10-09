Create database Resignation;
Use Resignation;

CREATE TABLE EmployeeResignations(
EmployeeID INT PRIMARY KEY,
Name VARCHAR(100),
Gender VARCHAR(10),
Age INT,
Department VARCHAR(50),
JobRole VARCHAR(50),
DateOfJoining DATE,
DateOfExit DATE,
PerformanceRating INT,
ResignationReason VARCHAR(100),
LastWorkingLocation VARCHAR(50)
);

-- Key SQL Queries for Analysis
-- 1. Department and Job Role with Highest Resignations
SELECT Department,JobRole,COUNT(*) Resignation_Count
FROM EmployeeResignations
GROUP BY Department,JobRole
ORDER BY Resignation_Count DESC;

-- 2. Average Age and Tenure at Resignation
SELECT AVG(Age) AS Avg_Age,
	AVG(DATEDIFF(DateOFExit,DateOfJoining)/365.25) AS AVG_Tenure
FROM EmployeeResignations;

-- 3. Year-wise Trend in Resignations
SELECT YEAR(DateOfExit) AS Exit_Year,
	COUNT(*) AS Resignation_count
FROM EmployeeResignations
GROUP BY Exit_Year
ORDER BY Resignation_count;

-- 4. Most Common Resignation Reasons
SELECT ResignationReason,COUNT(*) AS Resignation_Count
FROM EmployeeResignations
GROUP BY ResignationReason
ORDER BY Resignation_Count DESC;

-- 5. Gender and Department-wise Resignation Split
SELECT Department,Gender,COUNT(*) AS Resignation_Count
FROM EmployeeResignations
GROUP BY Department,Gender
ORDER BY Department,Gender ;

-- 6. Performance Rating at Exit Distribution
SELECT PerformanceRating,COUNT(*) AS Resignation_Count
FROM EmployeeResignations
GROUP BY PerformanceRating
ORDER BY PerformanceRating;

-- 7. Employee Exit Distribution by Location
SELECT LastWorkingLocation,COUNT(*) AS Resignation_Count
FROM EmployeeResignations
GROUP BY LastWorkingLocation
ORDER BY Resignation_Count DESC;

-- 8. Average tenure of resigned employees by department
SELECT Department,
	ROUND(AVG(DATEDIFF(DateOfExit,DateOfJoining)/365.25),2)AS Avg_Dept_Tenure
FROM EmployeeResignations
GROUP BY Department
ORDER BY Avg_Dept_Tenure DESC;