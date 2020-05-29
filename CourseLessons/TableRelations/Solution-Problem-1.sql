-- Problem 1 - One-To-One Relationship

create database [TestDB];

use [TestDB];

create table Passports (
	PassportID int identity(101, 1) primary key,
	PassportNumber nvarchar(8) not null unique
);

create table Persons (
	PersonID int identity(1, 1) primary key,
	FirstName nvarchar(50) not null,
	Salary decimal(8, 2) not null,
	PassportID int foreign key references Passports(PassportID) not null
);

insert into Passports (PassportNumber)
	values 
		('N34FG21B'),
		('K65LO4R7'),
		('ZE657QP2');

insert into Persons (FirstName, Salary, PassportID)
	values
		('Roberto', 43300.00, 102),
		('Tom', 56100.00, 103),
		('Yana', 60200.00, 101);