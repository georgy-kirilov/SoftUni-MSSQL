use [Diablo];

-- Problem 14
select top(50) 
	[Name], format([Start], 'yyyy-MM-dd') as [Start] 
	from Games
	where year([Start]) in (2011, 2012)
	order by
		[Start],
		[Name];

-- Problem 15
select 
	Username, 
	substring(Email, charindex('@', Email) + 1, len(Email) - charindex('@', Email)) 
		as [Email Provider]
	from Users
	order by 
		[Email Provider],
		[Username];

-- Problem 16
select Username, IpAddress
	from Users
	where IpAddress like '___.1%.%.___'
	order by Username;

-- Problem 17 
select 
	[Name],
	case
		when datepart(hour, [Start]) between 0 and 11 then 'Morning'
		when datepart(hour, [Start]) between 12 and 17 then 'Afternoon'
		else 'Evening'
	end as [Part of the Day],
	case
		when Duration <= 3 then 'Extra Short'
		when Duration between 4 and 6 then 'Short'
		when Duration > 6 then 'Long'
		else 'Extra Long'
	end as [Duration]
	from Games
	order by
		[Name],
		[Duration],
		[Part of the Day];
		