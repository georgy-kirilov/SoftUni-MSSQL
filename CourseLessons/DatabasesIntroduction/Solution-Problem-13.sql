-- Problem 13

use [master];

create database [Movies];

use [Movies];

create table Directors (
	Id int primary key identity,
	DirectorName nvarchar(40) not null,
	Notes nvarchar(max)
);

create table Genres (
	Id int primary key identity,
	GenreName nvarchar(40) not null,
	Notes nvarchar(max)
);

create table Categories (
	Id int primary key identity,
	CategoryName nvarchar(40) not null,
	Notes nvarchar(max)
);

create table Movies (
	Id int primary key identity,
	Title nvarchar(100) not null,
	DirectorId int foreign key references Directors(Id) not null,
	CopyrightYear date not null,
	[Length] int check([Length] > 0) not null,
	GenreId int foreign key references Genres(Id) not null,
	CategoryId int foreign key references Categories(Id) not null,
	Rating decimal(3, 1) check(Rating >= 0 and Rating <= 10) not null,
	Notes nvarchar(max)
);

insert into Directors(DirectorName, Notes)
	values
		('Steven Spielberg', 'The most famous director in the world.'),
		('Tarantino', null),
		('Rian Johnson', 'With five films under his belt, Johnson’s oeuvre feels like it’s just beginning.'),
		('Martin Scorsese', null),
		('David Cronenberg', null);

insert into Genres(GenreName, Notes)
	values
		('Comedy', 'Funny and easy'),
		('Action', 'Breathtaking'),
		('Fantasy', 'Science and theories'),
		('Horror', 'Scary, Terrifying'),
		('Romance', 'Love');

insert into Categories(CategoryName, Notes)
	values
		('Animation', 'Cartoons'),
		('Documentary', null),
		('Erotic', 'Sexual, adult'),
		('Musical', 'Music, songs'),
		('Biography', null);

insert into Movies(Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
	values
		('The Love Movie', 2, '10/10/2010', 144, 5, 3, 7.5, null),
		('Action Movie', 5, '11/11/2011', 120, 2, 4, 5.3, null),
		('The Matrix', 1, '03/03/1999', 132, 3, 1, 10.0, 'Keanu Reevs'),
		('8 mile', 4, '09/01/2002', 99, 2, 5, 6.9, 'Rap and Hip Hop'),
		('Titanic', 1, '04/08/1972', 174, 5, 3, 8.9, 'Cruise ship crashing');

select * from Movies;