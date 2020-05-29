-- Problem 4 - Self-Referencing

use [TestDB];

create table Teachers (
	TeacherID int identity(101, 1) primary key,
	[Name] nvarchar(30) not null,
	ManagerID int foreign key references Teachers(TeacherID)
);

insert into Teachers ([Name], ManagerID)
	values 
		('John', null),
		('Maya', 106),
		('Silvia', 106),
		('Ted', 105),
		('Mark', 101),
		('Greta', 101);