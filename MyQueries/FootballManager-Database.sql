use [master];

create database [FootballManager];

use [FootballManager];

create table FieldRoles (
	Id int primary key identity,
	RoleName varchar(15) check(len(RoleName) >= 1) not null unique
);

insert into FieldRoles (RoleName)
	values
		('Goalkeeper'),
		('Defender'),
		('Midfielder'),
		('Forward');

create table Positions (
	Id int primary key identity,
	PositionName varchar(5) check(len(PositionName) >= 1) not null unique,
	RoleId int foreign key references FieldRoles(Id) not null
);

insert into Positions (PositionName, RoleId)
	values
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

create table Countries (
	Id int primary key identity,
	CountryName varchar(30) check(len(CountryName) >= 4) not null unique
);

insert into Countries (CountryName)
	values
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

create table Championships (
	Id int primary key identity,
	ChampionshipName nvarchar(40) check(len(ChampionshipName) >= 1) not null unique,
	CountryId int foreign key references Countries(Id)
);

insert into Championships (ChampionshipName, CountryId)
	values
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

create table Teams (
	Id int primary key identity,
	TeamName nvarchar(100) check(len(TeamName) >= 3) not null unique
);

insert into Teams (TeamName)
	values
		('Bayern Munchen'),
		('Schalke 04'),
		('Juventus'),
		('Inter'),
		('Liverpool'),
		('Manchester United'),
		('FC Barcelona'),
		('Real Madrid'),
		('PSG');

create table TeamsChampionships (
	Id int primary key identity,
	TeamId int foreign key references Teams(Id) not null,
	ChampionshipId int foreign key references Championships(Id) not null
);


insert into TeamsChampionships (TeamId, ChampionshipId)
	values
		(1, 1),
		(2, 1),
		(3, 3),
		(4, 3),
		(5, 5),
		(6, 5),
		(7, 7),
		(8, 7);