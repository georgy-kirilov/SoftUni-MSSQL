use [Geography];

-- Problem 12 - type 1
select CountryName, IsoCode
	from Countries
	where len(CountryName) - len(replace(CountryName, 'A', '')) >= 3
	order by IsoCode;

-- Problem 12 - type 2
select CountryName, IsoCode
	from Countries
	where CountryName like '%a%a%a%'
	order by IsoCode;

-- Problem 13 - type 1
select 
	PeakName, 
	RiverName, 
	lower(PeakName + substring(RiverName, 2, len(RiverName) - 1)) as [Mix] 
	from Peaks as p, Rivers as r
	where right(p.PeakName, 1) = left(r.RiverName, 1)
	order by [Mix];

-- Problem 13 - type 2
select 
	PeakName, 
	RiverName, 
	lower(PeakName + substring(RiverName, 2, len(RiverName) - 1)) as [Mix] 
	from Peaks
	inner join Rivers
	on right(Peaks.PeakName, 1) = left(Rivers.RiverName, 1)
	order by [Mix];
	