-- Problem 16
CREATE VIEW V_EmployeesSalaries AS
SELECT FirstName, LastName, Salary
	FROM Employees;

-- Problem 17 => TODO

-- Problem 18
SELECT DISTINCT JobTitle
	FROM Employees;

-- Problem 19
SELECT TOP(10) *
	FROM Projects
	ORDER BY
		StartDate,
		[Name];

-- Problem 20
SELECT TOP(7) 
	FirstName, LastName, HireDate
	FROM Employees
	ORDER BY HireDate DESC;

-- Problem 21
UPDATE Employees
	SET Salary = Salary * 1.12
	WHERE DepartmentID IN (1, 2, 4, 11);

SELECT Salary FROM Employees;


	

