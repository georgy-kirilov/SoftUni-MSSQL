use [Geography];

-- Problem 12
select CountryName, IsoCode
	from Countries
	where len(CountryName) - len(replace(CountryName, 'A', '')) >= 3
	order by IsoCode;

-- Problem 13 => TODO