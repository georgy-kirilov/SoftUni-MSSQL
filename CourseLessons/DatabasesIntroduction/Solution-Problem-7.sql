-- Problem 7

create table People (
	Id int primary key identity,
	[Name] nvarchar(200) not null,
	Picture varbinary(max) check(datalength(Picture) <= 2 * 1024 * 1024),
	HeightM decimal(3, 2),
	WeightKg decimal(5, 2),
	Gender char(1) not null check(Gender = 'm' or Gender = 'f'),
	Birthdate date not null,
	Biography nvarchar(max)
);

insert into People([Name], Picture, HeightM, WeightKg, Gender, Birthdate, Biography)
	values
		('Stefan Toshev', null, 1.76, 71, 'm', '02/02/1994', 'A fan of Levski Sofia'),
		('Ivan Minev', null, 1.91, 80, 'm', '10/12/1992', 'Worked as a waiter in SASA'),
		('Denitsa Dimitrova', null, 1.71, 56, 'f', '08/10/2000', null),
		('Maria Koleva', null, 1.68, 53, 'f', '03/03/1984', null),
		('Stoyan Kolev', null, 1.86, 81, 'm', '11/08/1998', 'Air conditioning specialist');
