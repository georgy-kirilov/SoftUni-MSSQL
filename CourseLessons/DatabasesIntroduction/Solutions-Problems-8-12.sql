-- Problem 8
create table Users (
	Id bigint primary key identity,
	Username varchar(30) not null unique,
	[Password] varchar(26) not null,
	ProfilePicture varbinary(max) check(datalength(ProfilePicture) <= 900 * 1024),
	LastLoginTime datetime2 not null,
	IsDeleted bit not null
);

insert into Users(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
	values
		('pesho10', 'aBcF8Jp', null, '03/03/2020 10:22:12', 'false'),
		('murderer', '15mn21ABC', null, '04/01/2020 20:12:02', 'true'),
		('koteto69', 'chalgaFeq', null, '03/23/2020 08:03:44.9', 'false'),
		('azisss', 'tqnemojedaobi4a', null, '05/16/2020 23:32:32', 'false'),
		('goshoOtPo4ivka3', 'passw0rd1', null, '11/10/2019 12:12:12.12', 'true');

-- Problem 9
alter table Users
	drop constraint [PK__Users__3214EC07DDE8CFC8];

alter table Users
	add constraint PK_Users_CompositeIdUsername
	primary key(Id, Username);

-- Problem 10
alter table Users
	add constraintT CK_Users_PasswordLength
	check(len([Password]) >= 5);

-- Problem 11
alter table Users
	add constraint DF_Users_LastLoginTime
	default getdate() for LastLoginTime;

-- Problem 12
alter table Users
	drop constraint PK_Users_CompositeIdUsername;

alter table Users
	add constraint PK_Users_Id
	primary key(Id);

alter table Users
	add constraint CK_Users_UsernameLength
	check(len(Username) >= 3);