use [Geography];

-- Problem 12
select 
	c.CountryCode,
	m.MountainRange,
	p.PeakName,
	p.Elevation
	from Peaks as p
	join Mountains as m
		on p.MountainId = m.Id
	join MountainsCountries as mc
		on mc.MountainId = m.Id
	join Countries as c
		on mc.CountryCode = c.CountryCode
	where 
		c.CountryCode = 'BG' and
		p.Elevation > 2835
	order by p.Elevation desc;

-- Problem 13
select 
	c.CountryCode,
	count(c.CountryCode) as [MountainRanges] 
	from MountainsCountries as mc
	join Countries as c
		on mc.CountryCode = c.CountryCode
	join Mountains as m
		on mc.MountainId = m.Id
	where c.CountryCode in ('BG', 'RU', 'US')
	group by c.CountryCode;

-- Problem 14
select top(5)
	c.CountryName, 
	r.RiverName
	from Rivers as r
	join CountriesRivers as cr
		on cr.RiverId = r.Id
	right join Countries as c
		on cr.CountryCode = c.CountryCode
	join Continents as cont
		on c.ContinentCode = cont.ContinentCode
	where cont.ContinentCode = 'AF'
	order by c.CountryName asc;

-- Problem 15
select 
	ContinentCode, 
	CurrencyCode, 
	CurrencyCount as [CurrencyUsage] 
	from	
		(select 
			ContinentCode,
			CurrencyCode, 
			[CurrencyCount],
			dense_rank() over
			(partition by ContinentCode order by CurrencyCount desc) 
				as [CurrencyRank]
			from
				(select
					ContinentCode, 
					CurrencyCode, 
					count(*) as [CurrencyCount]
					from Countries
					group by ContinentCode, CurrencyCode
				) as [CurrencyCountQuery]
			where [CurrencyCount] > 1
		) as [CurrencyRankingQuery]
	where CurrencyRank = 1
	order by ContinentCode asc;

-- Problem 17
select top(5)
	c.CountryName,
	max(p.Elevation) as [HighestPeakElevation],
	max(r.[Length]) as [LongestRiverLength]
	from Countries as c
	left join MountainsCountries as mc
		on mc.CountryCode = c.CountryCode
	left join Mountains as m
		on mc.MountainId = m.Id
	left join Peaks as p
		on p.MountainId = m.Id
	left join CountriesRivers as cr
		on cr.CountryCode = c.CountryCode
	left join Rivers as r
		on cr.RiverId = r.Id
	group by c.CountryName
	order by 
		[HighestPeakElevation] desc,
		[LongestRiverLength] desc,
		c.CountryName asc;