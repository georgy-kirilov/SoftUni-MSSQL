use [Gringotts];

-- Problem 1
select count(Id) as [Count]
	from WizzardDeposits;

-- Problem 2
select max(MagicWandSize) as [LongestMagicWand]
	from WizzardDeposits;

-- Problem 3
select 
	DepositGroup, 
	max(MagicWandSize) as [LongestMagicWand]
	from WizzardDeposits
	group by DepositGroup;

-- Problem 4
select top(2) DepositGroup
	from WizzardDeposits
	group by DepositGroup
	order by avg(MagicWandSize);

-- Problem 5
select DepositGroup, sum(DepositAmount) as [TotalSum]
	from WizzardDeposits
	group by DepositGroup;

-- Problem 6
select DepositGroup, sum(DepositAmount) as [TotalSum]
	from WizzardDeposits
	where MagicWandCreator = 'Ollivander family'
	group by DepositGroup;

-- Problem 7
select DepositGroup, sum(DepositAmount) as [TotalSum]
	from WizzardDeposits
	where MagicWandCreator = 'Ollivander family'
	group by DepositGroup
	having sum(DepositAmount) < 150000
	order by [TotalSum] desc;

-- Problem 8
select 
	DepositGroup, 
	MagicWandCreator, 
	min(DepositCharge) as [MinDepositCharge]
	from WizzardDeposits
	group by DepositGroup, MagicWandCreator
	order by
		MagicWandCreator,
		DepositGroup;

-- Problem 9
select
	[AgeGroup],
	count(*) as [WizzardCount]
	from 
	(	
		select
		case
			when Age <= 10 then '[0-10]'
			when Age >= 11 and Age <= 20 then '[11-20]'
			when Age >= 21 and Age <= 30 then '[21-30]'
			when Age >= 31 and Age <= 40 then '[31-40]'
			when Age >= 41 and Age <= 50 then '[41-50]'
			when Age >= 51 and Age <= 60 then '[51-60]'
			else '[61+]'
		end as AgeGroup
		from WizzardDeposits
	) as [WizzardGroups]
	group by [WizzardGroups].AgeGroup;

-- Problem 10
select 
	distinct left(FirstName, 1)
	from WizzardDeposits
	where DepositGroup = 'Troll Chest'
	group by DepositGroup, FirstName;

-- Problem 11
select 
	DepositGroup, 
	IsDepositExpired, 
	avg(DepositInterest) as [AverageInterest]
	from WizzardDeposits
	where DepositStartDate > '01/01/1985'
	group by DepositGroup, IsDepositExpired
	order by 
		DepositGroup desc,
		IsDepositExpired asc;

-- Problem 12
select 
	sum([SubqueryTable].Difference) as [SumDifference]
	from 
	(
		select 
			FirstName as [Host Wizard],
			DepositAmount as [Host Wizard Deposit],
			lead(FirstName) over(order by Id) as [Guest Wizard],
			lead(DepositAmount) over(order by Id) as [Guest Wizard Deposit],
			(DepositAmount- lead(DepositAmount) over(order by Id)) as [Difference]
			from WizzardDeposits
	) as [SubqueryTable]
	where [SubqueryTable].[Guest Wizard] is not null;