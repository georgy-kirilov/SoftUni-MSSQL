-- Problem 16
create view V_EmployeesSalaries as
select FirstName, LastName, Salary
	from Employees;

-- Problem 17
create view V_EmployeeNameJobTitle as
select 
	concat(FirstName, ' ', isnull(MiddleName, ''), ' ', LastName)
	as [Full Name],
	JobTitle
	from Employees;

-- Problem 18
select distinct JobTitle
	from Employees;

-- Problem 19
select top(10) *
	from Projects
	order by
		StartDate,
		[Name];

-- Problem 20
select top(7) 
	FirstName, LastName, HireDate
	from Employees
	order by HireDate desc;

-- Problem 21
update Employees
	set Salary = Salary * 1.12
	where DepartmentID in (1, 2, 4, 11);

select Salary from Employees;


	

