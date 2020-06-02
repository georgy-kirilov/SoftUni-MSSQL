-- Problem 18

select 
	ProductName, 
	OrderDate,
	dateadd(day, 3, OrderDate) as [Pay Due],
	dateadd(month, 1, OrderDate) as [Deliver Due]
	from Orders;

-- Problem 19

use [TestDB];

create table People (
	Id int identity primary key,
	[Name] varchar(50) not null,
	Birthdate datetime2 not null
);

insert into People ([Name], Birthdate)
	values
		('Victor', '2000-12-07 00:00:00.000'),
		('Steven', '1992-09-10 00:00:00.000'),
		('Stephen', '1910-09-19 00:00:00.000'),
		('John', '2010-01-06 00:00:00.000');
	