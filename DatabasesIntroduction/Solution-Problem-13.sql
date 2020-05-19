-- Problem 13
CREATE DATABASE Movies;

CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(40) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY,
	GenreName NVARCHAR(40) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(40) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(100) NOT NULL,
	DirectorId INT 
	FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
	CopyrightYear DATE NOT NULL,
	[Length] INT CHECK([Length] > 0) NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Rating DECIMAL(3, 1) 
	CHECK(Rating >= 0 AND Rating <= 10) NOT NULL,
	Notes NVARCHAR(MAX)
);

INSERT INTO Directors(DirectorName, Notes)
	VALUES
		('Steven Spielberg', 'The most famous director in the world.'),
		('Tarantino', NULL),
		('Rian Johnson', 'With five films under his belt, Johnson’s oeuvre feels like it’s just beginning.'),
		('Martin Scorsese', NULL),
		('David Cronenberg', NULL);

INSERT INTO Genres(GenreName, Notes)
	VALUES
		('Comedy', 'Funny and easy'),
		('Action', 'Breathtaking'),
		('Fantasy', 'Science and theories'),
		('Horror', 'Scary, Terrifying'),
		('Romance', 'Love');

INSERT INTO Categories(CategoryName, Notes)
	VALUES
		('Animation', 'Cartoons'),
		('Documentary', NULL),
		('Erotic', 'Sexual, adult'),
		('Musical', 'Music, songs'),
		('Biography', NULL);

INSERT INTO Movies(Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
	VALUES
		('The Love Movie', 2, '10/10/2010', 144, 5, 3, 7.5, NULL),
		('Action Movie', 5, '11/11/2011', 120, 2, 4, 5.3, NULL),
		('The Matrix', 1, '03/03/1999', 132, 3, 1, 10.0, 'Keanu Reevs'),
		('8 mile', 4, '09/01/2002', 99, 2, 5, 6.9, 'Rap and Hip Hop'),
		('Titanic', 1, '04/08/1972', 174, 5, 3, 8.9, 'Cruise ship crashing');

SELECT * FROM Movies;