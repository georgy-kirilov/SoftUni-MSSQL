-- Problem 1

use [master];

create database [Minions]; 

use [Minions];

-- Problem 2
create table Minions (
	Id int primary key,
	[Name] varchar(30) not null,
	Age int
);

create table Towns (
	Id int primary key,
	[Name] varchar(30) not null
);

-- Problem 3
alter table Minions
	add TownId int foreign key(TownId) references Towns(Id);

-- Problem 4
insert into Towns(Id, [Name])
	values
		(1, 'Sofia'),
		(2, 'Plovdiv'),
		(3, 'Varna');

insert into Minions(Id, [Name], Age, TownId)
	values
		(1, 'Kevin', 22, 1),
		(2, 'Bob', 15, 3),
		(3, 'Steward', null, 2);

-- Problem 5
truncate table Minions;

-- Problem 6
drop table Minions;
drop table Towns;