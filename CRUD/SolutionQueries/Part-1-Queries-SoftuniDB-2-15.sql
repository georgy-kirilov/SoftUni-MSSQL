-- Problem 2
SELECT * FROM Departments;

-- Problem 3
SELECT [Name] FROM Departments;

-- Problem 4
SELECT FirstName, LastName, Salary
	FROM Employees;

-- Problem 5
SELECT FirstName, MiddleName, LastName
	FROM Employees;

-- Problem 6
SELECT (FirstName + '.' + LastName + '@softuni.bg') 
	AS [Full Email Address]
	FROM Employees;

-- Problem 7
SELECT DISTINCT Salary
	FROM Employees;

-- Problem 8
SELECT * 
	FROM Employees
	WHERE JobTitle = 'Sales Representative';

-- Problem 9
SELECT FirstName, LastName, JobTitle
	FROM Employees
	WHERE Salary BETWEEN 20000 AND 30000;

-- Problem 10
SELECT (FirstName + ' ' + MiddleName + ' ' + LastName) 
	AS [Full Name]
	FROM Employees
	WHERE Salary IN (25000, 14000, 12500, 23600);

-- Problem 11
SELECT FirstName, LastName
	FROM Employees
	WHERE ManagerID IS NULL;

-- Problem 12
SELECT FirstName, LastName, Salary
	FROM Employees
	WHERE Salary > 50000
	ORDER BY Salary DESC;

-- Problem 13
SELECT TOP(5) FirstName, LastName
	FROM Employees
	ORDER BY Salary DESC;

-- Problem 14
SELECT FirstName, LastName
	FROM Employees
	WHERE DepartmentID != 4;

-- Problem 15
SELECT * 
	FROM Employees
	ORDER BY 
		Salary DESC,
		FirstName,
		LastName DESC,
		MiddleName;

