-- Problem 2
select * from Departments;

-- Problem 3
select [Name] from Departments;

-- Problem 4
select FirstName, LastName, Salary
	from Employees;

-- Problem 5
select FirstName, MiddleName, LastName
	from Employees;

-- Problem 6
select (FirstName + '.' + LastName + '@softuni.bg') 
	as [Full Email Address]
	from Employees;

-- Problem 7
select distinct Salary
	from Employees;

-- Problem 8
select * 
	from Employees
	where JobTitle = 'Sales Representative';

-- Problem 9
select FirstName, LastName, JobTitle
	from Employees
	where Salary between 20000 and 30000;

-- Problem 10
select (FirstName + ' ' + MiddleName + ' ' + LastName) 
	as [Full Name]
	from Employees
	where Salary in (25000, 14000, 12500, 23600);

-- Problem 11
select FirstName, LastName
	from Employees
	where ManagerID is null;

-- Problem 12
select FirstName, LastName, Salary
	from Employees
	where Salary > 50000
	order by Salary desc;

-- Problem 13
select top(5) FirstName, LastName
	from Employees
	order by Salary desc;

-- Problem 14
select FirstName, LastName
	from Employees
	where DepartmentID != 4;

-- Problem 15
select * 
	from Employees
	order by 
		Salary desc,
		FirstName,
		LastName desc,
		MiddleName;

