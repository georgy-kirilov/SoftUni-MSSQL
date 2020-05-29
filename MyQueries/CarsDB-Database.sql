use [master];

create database [CarsDB];

use [CarsDB];

create table Cars (
	Id int primary key identity,
	RegistrationNumber nvarchar(8) not null unique,
	BrandName nvarchar(30) not null,
	ModelName nvarchar(30) not null,
	Color nvarchar(30),
	Kilometers int check(Kilometers >= 0) not null,
	MfgDate date check(MfgDate >= '1960-01-01') not null
);

alter table Cars
	add constraint CK_RegistrationNumber
	check(len(RegistrationNumber) >= 6);

insert into Cars (RegistrationNumber, BrandName, ModelName, Color, Kilometers, MfgDate)
	values
		('PK1234MH', 'BMW', 'X5', null, 120000, '2014-03-10'),
		('CA2020KA', 'Opel', 'Astra', 'White', 90222, '2011-08-12'),
		('A0099PP', 'Ford', 'Fiesta', 'Dark-Blue', 219180, '2009-09-01');