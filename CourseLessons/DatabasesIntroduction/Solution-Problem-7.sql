-- Problem 7
CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX) 
	CHECK(DATALENGTH(Picture) <= 2 * 1024 * 1024),
	HeightM DECIMAL(3, 2),
	WeightKg DECIMAL(5, 2),
	Gender CHAR(1) NOT NULL 
	CHECK(Gender = 'm' OR Gender = 'f'),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
);

INSERT INTO People([Name], Picture, HeightM, WeightKg, Gender, Birthdate, Biography)
	VALUES
		('Stefan Toshev', NULL, 1.76, 71, 'm', '02/02/1994', 'A fan of Levski Sofia'),
		('Ivan Minev', NULL, 1.91, 80, 'm', '10/12/1992', 'Worked as a waiter in SASA'),
		('Denitsa Dimitrova', NULL, 1.71, 56, 'f', '08/10/2000', NULL),
		('Maria Koleva', NULL, 1.68, 53, 'f', '03/03/1984', NULL),
		('Stoyan Kolev', NULL, 1.86, 81, 'm', '11/08/1998', 'Air conditioning specialist');
