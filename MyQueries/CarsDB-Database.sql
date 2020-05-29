CREATE DATABASE CarsDB;

CREATE TABLE Cars (
	Id INT PRIMARY KEY IDENTITY,
	RegistrationNumber NVARCHAR(8) NOT NULL UNIQUE,
	BrandName NVARCHAR(30) NOT NULL,
	ModelName NVARCHAR(30) NOT NULL,
	Color NVARCHAR(30),
	Kilometers INT CHECK(Kilometers >= 0) NOT NULL ,
	MfgDate DATE CHECK(MfgDate >= '1960-01-01') NOT NULL
);

ALTER TABLE Cars
	ADD CONSTRAINT CK_RegistrationNumber
	CHECK(LEN(RegistrationNumber) >= 6);

INSERT INTO Cars (RegistrationNumber, BrandName, ModelName, Color, Kilometers, MfgDate)
	VALUES
		('PK1234MH', 'BMW', 'X5', NULL, 120000, '2014-03-10'),
		('CA2020KA', 'Opel', 'Astra', 'White', 90222, '2011-08-12'),
		('A0099PP', 'Ford', 'Fiesta', 'Dark-Blue', 219180, '2009-09-01');

DROP TABLE Cars;