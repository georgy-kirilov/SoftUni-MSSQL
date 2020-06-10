use [SoftUni];

-- Problem 13
select 
	DepartmentID, 
	sum(Salary) as [TotalSalary]
	from Employees
	group by DepartmentID
	order by DepartmentID;

-- Problem 14
select DepartmentID, min(Salary) as [MinimumSalary]
	from Employees
	where DepartmentID in (2, 5, 7)
	group by DepartmentID;

-- Problem 15
select * 
	into [HighPaidEmployees]
	from Employees 
	where Salary > 30000;

delete from [HighPaidEmployees]
	where ManagerID = 42;

update [HighPaidEmployees]
	set Salary += 5000
	where DepartmentID = 1;

select DepartmentID, avg(Salary) as [AverageSalary]
	from [HighPaidEmployees]
	group by DepartmentID;

-- Problem 16
select DepartmentID, max(Salary) as [MaxSalary]
	from Employees
	group by DepartmentID
	having max(Salary) not between 30000 and 70000;
	--having max(Salary) < 30000 or max(Salary) > 70000;

-- Problem 17
select count(*) as [Count]
	from Employees 
	where ManagerID is null;

-- Problem 18
select distinct
	DepartmentID, 
	[RankedEmployeesBySalary].Salary as [ThirdHighestSalary] 
	from 
	(
		select *,
		dense_rank() over(partition by DepartmentID order by Salary desc) as [RankedSalary]
		from Employees
	) as [RankedEmployeesBySalary]
	where [RankedEmployeesBySalary].RankedSalary = 3;

-- Problem 19 => TODO




