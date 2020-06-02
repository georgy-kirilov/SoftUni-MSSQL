use [Diablo];

-- Problem 14
select top(50) [Name], format([Start], 'yyyy-MM-dd') as [Start] 
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

-- Problem 17 => TODO: doesn't work in JUDGE
select 
	[Name] as [Game],
	case
		when datepart(hour, [Start]) >= 0 and datepart(hour, [Start]) < 12 then 'Morning'
		when datepart(hour, [Start]) >= 12 and datepart(hour, [Start]) < 18 then 'Afternoon'
		when datepart(hour, [Start]) >= 18 and datepart(hour, [Start]) < 24 then 'Evening'
	end as [Part of the Day],
	case
		when Duration <= 3 then 'Extra short'
		when Duration >= 4 and Duration <= 6 then 'Short'
		when Duration > 6 then 'Long'
		when Duration is null then 'Extra long'
	end as [Duration]
	from Games
	order by
		Game,
		Duration,
		[Part of the Day];
		