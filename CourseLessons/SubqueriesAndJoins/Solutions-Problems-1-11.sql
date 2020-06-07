use [SoftUni];

-- Problem 1
select top(5) 
	e.EmployeeID, 
	e.JobTitle, 
	a.AddressID, 
	a.AddressText
	from Employees as e
	join Addresses as a
		on e.AddressID = a.AddressID
	order by a.AddressID;

-- Problem 2
select top(50)
	e.FirstName, 
	e.LastName, 
	t.[Name], 
	a.AddressText
	from Employees as e
	join Addresses as a
		on e.AddressID = a.AddressID
	join Towns as t
		on a.TownID = t.TownID
	order by
		e.FirstName,
		e.LastName;

-- Problem 3
select 
	e.EmployeeID, 
	e.FirstName, 
	e.LastName, 
	d.[Name]
	from Employees as e
	join Departments as d
		on e.DepartmentID = d.DepartmentID
	where d.[Name] = 'Sales'
	order by e.EmployeeID;

-- Problem 4
select top(5)
	e.EmployeeID, 
	e.FirstName, 
	e.Salary, 
	d.[Name]
	from Employees as e
	join Departments as d
		on e.DepartmentID = d.DepartmentID
	where e.Salary > 15000
	order by d.DepartmentID asc;

-- Problem 5
select top(3)
	e.EmployeeID, e.[FirstName]
	from Employees as e
	left join EmployeesProjects as ep
		on ep.EmployeeID = e.EmployeeID
	left join Projects as pr
		on ep.ProjectID = pr.ProjectID
	where ep.ProjectID is null
	order by EmployeeID asc;

-- Problem 6
select 
	e.FirstName, 
	e.LastName, 
	e.HireDate, 
	d.[Name]
	from Employees as e
	join Departments as d
		on e.DepartmentID = d.DepartmentID
	where 
		e.HireDate > '1/1/1999' and
		(d.[Name] = 'Sales' or d.[Name] = 'Finance')
	order by e.HireDate asc;

-- Problem 7
select top(5) 
	e.EmployeeID, 
	e.FirstName, 
	pr.[Name]
	from Employees as e
	join EmployeesProjects as ep
		on ep.EmployeeID = e.EmployeeID
	join Projects as pr
		on ep.ProjectID = pr.ProjectID
	where 
		pr.StartDate > '2002-08-13' and 
		pr.EndDate is null
	order by e.EmployeeID asc;

-- Problem 8
select 
	e.EmployeeID,
	e.FirstName,	
	case
		when year(pr.StartDate) >= 2005 then null
		else pr.[Name]
	end as [ProjectName]
	from Employees as e
	join EmployeesProjects as ep
		on ep.EmployeeID = e.EmployeeID
	join Projects as pr
		on ep.ProjectID = pr.ProjectID
	where 
		e.EmployeeID = 24;

-- Problem 9
select 
	a.EmployeeID, 
	a.FirstName, 
	a.ManagerID, 
	b.FirstName 
	from Employees as a
	join Employees as b
		on a.ManagerID = b.EmployeeID
	where a.ManagerID in (3, 7)
	order by a.EmployeeID asc;

-- Problem 10
select top(50)
	e.EmployeeID,
	concat(e.FirstName, ' ', e.LastName) as [EmployeeName],
	concat(m.FirstName, ' ', m.LastName) as [ManagerName],
	d.[Name] as [DepartmentName]
	from Employees as e
	join Employees as m
		on e.ManagerID = m.EmployeeID
	join Departments as d
		on e.DepartmentID = d.DepartmentID
	order by e.EmployeeID;

-- Problem 11
select top(1)
	avg(Salary) as [MinAverageSalary]
	from Employees
	group by DepartmentID
	order by [MinAverageSalary];




