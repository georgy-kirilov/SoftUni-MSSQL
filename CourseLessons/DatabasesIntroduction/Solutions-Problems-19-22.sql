-- Problem 19
select * from Towns; 
select * from Departments;
select * from Employees;

-- Problem 20
select * 
	from Towns
	order by [Name];

select *
	from Departments
	order by [Name];

select *
	from Employees
	order by Salary desc;

-- Problem 21
select [Name] 
	from Towns
	order by [Name];

select [Name]
	from Departments
	order by [Name];

select 
	FirstName, LastName, JobTitle, Salary
	from Employees
	order by Salary desc;

-- Problem 22
update Employees
	set Salary = Salary * 1.1;

select Salary
	from Employees;