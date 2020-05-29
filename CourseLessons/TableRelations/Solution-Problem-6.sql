-- Problem 6 - University Database

create database [UniversityDB];

use [UniversityDB];

create table Subjects (
	SubjectID int identity(1, 1) primary key,
	SubjectName nvarchar(50) not null unique
);

create table Majors (
	MajorID int identity(1, 1) primary key,
	[Name] nvarchar(50) not null
);

create table Students (
	StudentID int identity(1, 1) primary key,
	StudentNumber int not null unique,
	StudentName nvarchar(50) not null,
	MajorID int foreign key references Majors(MajorID) not null
);

create table Payments (
	PaymentID int identity(1, 1) primary key,
	PaymentDate date not null,
	PaymentAmount decimal(8, 2) not null check(PaymentAmount > 0),
	StudentID int foreign key references Students(StudentID) not null
);

create table Agenda (
	StudentID int foreign key references Students(StudentID) not null,
	SubjectID int foreign key references Subjects(SubjectID) not null,
	primary key(StudentID, SubjectID)
);

