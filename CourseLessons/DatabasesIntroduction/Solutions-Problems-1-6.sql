-- Problem 1
CREATE DATABASE Minions; 

-- Problem 2
CREATE TABLE Minions (
	Id INT PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
	Age INT
);

CREATE TABLE Towns (
	Id INT PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
);

-- Problem 3
ALTER TABLE Minions
ADD TownId INT FOREIGN KEY(TownId) REFERENCES Towns(Id);

-- Problem 4
INSERT INTO Towns(Id, [Name])
	VALUES
		(1, 'Sofia'),
		(2, 'Plovdiv'),
		(3, 'Varna');

INSERT INTO Minions(Id, [Name], Age, TownId)
	VALUES
		(1, 'Kevin', 22, 1),
		(2, 'Bob', 15, 3),
		(3, 'Steward', NULL, 2);

-- Problem 5
TRUNCATE TABLE Minions;

-- Problem 6
DROP TABLE Minions;
DROP TABLE Towns;