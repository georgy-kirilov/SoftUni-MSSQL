-- Problem 2 - One-To-Many Relationship

use [TestDB];

create table Manufacturers (
	ManufacturerID int identity(1, 1) primary key,
	[Name] nvarchar(50) not null unique,
	EstablishedOn date not null
);

create table Models (
	ModelID int identity(101, 1) primary key,
	[Name] nvarchar(50) not null,
	ManufacturerID int foreign key references Manufacturers(ManufacturerID) not null
);

insert into Manufacturers ([Name], EstablishedOn)
	values
		('BMW', '07/03/1916'),
		('Tesla', '01/01/2003'),
		('Lada', '01/05/1966');

insert into Models ([Name], ManufacturerID)
	values
		('X1', 1),
		('i6', 1),
		('Model S', 2),
		('Model X', 2),
		('Model 3', 2),
		('Nova', 3);