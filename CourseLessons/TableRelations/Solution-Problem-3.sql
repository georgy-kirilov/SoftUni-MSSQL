-- Problem 3 - Many-To-Many Relationship

use [TestDB];

create table Students (
	StudentID int primary key identity(1, 1),
	[Name] nvarchar(20) not null
);

create table Exams (
	ExamID int primary key identity(101, 1),
	[Name] nvarchar(30) not null unique
);

create table StudentsExams (
	StudentID int foreign key references Students(StudentID),
	ExamID int foreign key references Exams(ExamID),
	primary key(StudentID, ExamID)
);

insert into Students ([Name])
	values 
		('Mila'), 
		('Toni'), 
		('Ron');

insert into Exams ([Name])
	values
		('SpringMVC'),
		('Neo4j'),
		('Oracle 11g');

insert into StudentsExams (StudentID, ExamID)
	values 
		(1, 101),
		(1, 102),
		(2, 101),
		(3, 103),
		(2, 102),
		(2, 103);