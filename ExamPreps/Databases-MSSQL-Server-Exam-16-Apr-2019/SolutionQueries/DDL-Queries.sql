create database [Airport];

use [Airport];

create table Planes (
	Id int primary key identity,
	[Name] nvarchar(30) not null,
	Seats int not null,
	[Range] int not null
);

create table Flights (
	Id int primary key identity,
	DepartureTime datetime2,
	ArrivalTime datetime2,
	Origin nvarchar(50) not null,
	Destination nvarchar(50) not null,
	PlaneId int not null foreign key references Planes(Id)
);

create table Passengers (
	Id int primary key identity,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Age int not null,
	[Address] nvarchar(30) not null,
	PassportId nvarchar(11) not null
);

create table LuggageTypes (
	Id int primary key identity,
	[Type] nvarchar(30) not null
);

create table Luggages (
	Id int primary key identity,
	LuggageTypeId int not null foreign key references LuggageTypes(Id),
	PassengerId int not null foreign key references Passengers(Id)
);

create table Tickets (
	Id int primary key identity,
	PassengerId int not null foreign key references Passengers(Id),
	FlightId int not null foreign key references Flights(Id),
	LuggageId int not null foreign key references Luggages(Id),
	Price decimal(15, 2) not null
);

--alter database Airport set single_user with rollback immediate;
