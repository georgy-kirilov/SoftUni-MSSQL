-- Problem 16

use [master];

create database [SoftUni];

use [SoftUni];

create table Towns (
	Id int primary key identity,
	[Name] nvarchar(50) not null
);

create table Addresses (
	Id int primary key identity,
	AddressText nvarchar(200) not null,
	TownId int foreign key references Towns(Id) not null
);

create table Departments (
	Id int primary key identity,
	[Name] nvarchar(100) not null unique
);

create table Employees (
	Id int primary key identity,
	FirstName nvarchar(50) not null,
	MiddleName nvarchar(50),
	LastName nvarchar(50) not null,
	JobTitle nvarchar(50) not null,
	DepartmentId int foreign key references Departments(Id) not null,
	HireDate date not null,
	Salary decimal(8, 2) check(Salary > 0) not null,
	AddressId int foreign key references Addresses(Id)
);

-- Problem 18

insert into Towns([Name])
	values
		('Sofia'),
		('Plovdiv'),
		('Varna'),
		('Burgas');

insert into Departments([Name])
	values
		('Engineering'),
		('Sales'),
		('Marketing'),
		('Software Development'),
		('Quality Assurance');

insert into Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
	values
		('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '02/01/2013', 3500.00),
		('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '03/02/2004', 4000.00),
		('Maria', 'Petrova', 'Ivanova',	'Intern', 5, '08/28/2016', 525.25),
		('Georgi', 'Teziev', 'Ivanov',	'CEO', 2, '12/09/2007',	3000.00),
		('Peter', 'Pan', 'Pan',	'Intern', 3, '08/28/2016', 599.88);