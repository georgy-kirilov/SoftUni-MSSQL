USE [master];

CREATE DATABASE FootballManager;

USE [FootballManager];

CREATE TABLE FieldRoles (
	Id INT PRIMARY KEY IDENTITY,
	RoleName VARCHAR(15) 
	CHECK(LEN(RoleName) >= 1) NOT NULL UNIQUE
);

INSERT INTO FieldRoles (RoleName)
	VALUES
		('Goalkeeper'),
		('Defender'),
		('Midfielder'),
		('Forward');

CREATE TABLE Positions (
	Id INT PRIMARY KEY IDENTITY,
	PositionName VARCHAR(5) 
	CHECK(LEN(PositionName) >= 1) NOT NULL UNIQUE,
	RoleId INT FOREIGN KEY REFERENCES FieldRoles(Id) NOT NULL
);

INSERT INTO Positions (PositionName, RoleId)
	VALUES
		('GK', 1),
		('LB', 2),
		('CB', 2),
		('RB', 2),
		('LWB', 2),
		('RWB', 2),
		('CDM', 3),
		('CM', 3),
		('CAM', 3),
		('LM', 3),
		('RM', 3),
		('LW', 4),
		('RW', 4),
		('LF', 4),
		('RF', 4),
		('CF', 4),
		('ST', 4);

CREATE TABLE Countries (
	Id INT PRIMARY KEY IDENTITY,
	CountryName VARCHAR(30) 
	CHECK(LEN(CountryName) >= 4) NOT NULL UNIQUE
);

INSERT INTO Countries (CountryName)
	VALUES
		('Argentina'),
		('Brazil'),
		('Chile'),
		('Germany'),
		('Italy'),
		('England'),
		('Spain'),
		('France'),
		('Netherlands'),
		('Egypt');

CREATE TABLE Championships (
	Id INT PRIMARY KEY IDENTITY,
	ChampionshipName NVARCHAR(40) 
	CHECK(LEN(ChampionshipName) >= 1) NOT NULL UNIQUE,
	CountryId INT FOREIGN KEY REFERENCES Countries(Id)
);

INSERT INTO Championships (ChampionshipName, CountryId)
	VALUES
		('Bundesliga', 4),
		('Bundesliga 2', 4),
		('Serie A', 5),
		('Serie B', 5),
		('Premier League', 6),
		('Championship', 6),
		('LaLiga Santander', 7),
		('Ligue 1', 8),
		('Ligue 2', 8),
		('Eredivisie', 9);

CREATE TABLE Teams (
	Id INT PRIMARY KEY IDENTITY,
	TeamName NVARCHAR(100) 
	CHECK(LEN(TeamName) >= 3) NOT NULL UNIQUE
);

INSERT INTO Teams (TeamName)
	VALUES
		('Bayern Munchen'),
		('Schalke 04'),
		('Juventus'),
		('Inter'),
		('Liverpool'),
		('Manchester United'),
		('FC Barcelona'),
		('Real Madrid'),
		('PSG');

CREATE TABLE TeamsChampionships (
	Id INT PRIMARY KEY IDENTITY,
	TeamId INT FOREIGN KEY REFERENCES Teams(Id) NOT NULL,
	ChampionshipId INT FOREIGN KEY REFERENCES Championships(Id) NOT NULL
);


INSERT INTO TeamsChampionships (TeamId, ChampionshipId)
	VALUES
		(1, 1),
		(2, 1),
		(3, 3),
		(4, 3),
		(5, 5),
		(6, 5),
		(7, 7),
		(8, 7);