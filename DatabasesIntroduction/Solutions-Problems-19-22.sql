-- Problem 19
SELECT * FROM Towns; 
SELECT * FROM Departments;
SELECT * FROM Employees;

-- Problem 20
SELECT * 
FROM Towns
ORDER BY [Name];

SELECT *
FROM Departments
ORDER BY [Name];

SELECT *
FROM Employees
ORDER BY Salary DESC;

-- Problem 21
SELECT [Name] 
FROM Towns
ORDER BY [Name];

SELECT [Name]
FROM Departments
ORDER BY [Name];

SELECT FirstName, LastName, JobTitle, Salary
FROM Employees
ORDER BY Salary DESC;

-- Problem 22
UPDATE Employees
SET Salary = Salary * 1.1;

SELECT Salary
FROM Employees;