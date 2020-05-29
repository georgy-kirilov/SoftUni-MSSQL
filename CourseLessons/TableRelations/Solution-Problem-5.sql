-- Problem 5 - Online Store Database

create database OnlineStoreDB;

use [OnlineStoreDB];

create table Cities (
	CityID int identity(1, 1) primary key,
	[Name] varchar(50) not null unique
);

create table Customers (
	CustomerID int identity(1, 1) primary key,
	[Name] varchar(50) not null,
	Birthday date not null,
	CityID int foreign key references Cities(CityID) not null
);

create table Orders (
	OrderID int identity(1, 1) primary key,
	CustomerID int foreign key references Customers(CustomerID) not null
);

create table ItemTypes (
	ItemTypeID int identity(1, 1) primary key,
	[Name] varchar(50) not null unique
);

create table Items (
	ItemID int identity(1, 1) primary key,
	[Name] varchar(50) not null,
	ItemTypeID int foreign key references ItemTypes(ItemTypeID) not null
);

create table OrderItems (
	OrderID int foreign key references Orders(OrderID) not null,
	ItemID int foreign key references Items(ItemID) not null,
	primary key(OrderID, ItemID)
);
