-- Problem 22
select PeakName
	from Peaks
	order by PeakName;

-- Problem 23
select top(30) CountryName, [Population]
	from Countries
	where ContinentCode = 'EU'
	order by 
		[Population] desc,
		CountryName;

-- Problem 24
select CountryName, CountryCode,
	case
		when CurrencyCode = 'EUR' then 'Euro'
		else 'Not Euro'
	end as Currency
	from Countries
	order by CountryName;