use [SoftUni];

-- Problem 1
select FirstName, LastName
	from Employees
	where FirstName like 'SA%';

-- Problem 2
select FirstName, LastName
	from Employees
	where LastName like '%ei%';

-- Problem 3
select FirstName	
	from Employees
	where 
		(DepartmentID = 3 or DepartmentID = 10) and 
		(year(HireDate) >= 1995 and year(HireDate) <= 2005);

-- Problem 4
select FirstName, LastName 
	from Employees
	where JobTitle not like '%engineer%';	

-- Problem 5
select [Name]
	from Towns
	where len([Name]) = 5 or len([Name]) = 6
	order by [Name];

-- Problem 6
select TownID, [Name]
	from Towns
	where left([Name], 1) in ('M', 'K', 'B', 'E')
	order by [Name];

-- Problem 7
select TownID, [Name]
	from Towns
	where left([Name], 1) not in ('R', 'B', 'D')
	order by [Name];

-- Problem 8
go

create view V_EmployeesHiredAfter2000 as
select FirstName, LastName
	from Employees
	where year(HireDate) > 2000;

go

-- Problem 9
select FirstName, LastName
	from Employees
	where len(LastName) = 5;

-- Problem 10
select 
	EmployeeID, 
	FirstName, 
	LastName, 
	Salary,
	dense_rank() 
		over (partition by Salary order by EmployeeID) 
		as [Rank]
	from Employees
	where Salary >= 10000 and Salary <= 50000
	order by Salary desc;

-- Problem 11
select * from 
	(select
		EmployeeID, 
		FirstName, 
		LastName, 
		Salary,
		dense_rank() 
			over (partition by Salary order by EmployeeID) 
			as [Rank]
		from Employees
		where Salary >= 10000 and Salary <= 50000) 
		as [TemporaryTable]
		where [Rank] = 2
		order by Salary desc;




