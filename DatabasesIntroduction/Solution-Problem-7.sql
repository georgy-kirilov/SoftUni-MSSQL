-- Problem 7
CREATE TABLE People (
	Id INT IDENTITY(1, 1),
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX) NULL,
	HeightM DECIMAL(3, 2) NULL,
	WeightKg DECIMAL(5, 2) NULL,
	Gender CHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX) NULL,
	PRIMARY KEY(Id),
	CONSTRAINT Gender CHECK(Gender = 'm' OR Gender = 'f')
);

INSERT INTO People 
	VALUES
		('Stefan Toshev', NULL, 1.76, 71, 'm', '02/02/1994', 'A fan of Levski Sofia'),
		('Ivan Minev', NULL, 1.91, 80, 'm', '10/12/1992', 'Worked as a waiter in SASA'),
		('Denitsa Dimitrova', NULL, 1.71, 56, 'f', '08/10/2000', NULL),
		('Maria Koleva', NULL, 1.68, 53, 'f', '03/03/1984', NULL),
		('Stoyan Kolev', NULL, 1.86, 81, 'm', '11/08/1998', 'Air conditioning specialist');
