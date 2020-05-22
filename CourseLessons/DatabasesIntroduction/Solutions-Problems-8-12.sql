-- Problem 8
CREATE TABLE Users (
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL UNIQUE,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX) 
	CHECK(DATALENGTH(ProfilePicture) <= 900 * 1024),
	LastLoginTime DATETIME2 NOT NULL,
	IsDeleted BIT NOT NULL
);

INSERT INTO Users(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
	VALUES
		('pesho10', 'aBcF8Jp', NULL, '03/03/2020 10:22:12', 'false'),
		('murderer', '15mn21ABC', NULL, '04/01/2020 20:12:02', 'true'),
		('koteto69', 'chalgaFeq', NULL, '03/23/2020 08:03:44.9', 'false'),
		('azisss', 'tqnemojedaobi4a', NULL, '05/16/2020 23:32:32', 'false'),
		('goshoOtPo4ivka3', 'passw0rd1', NULL, '11/10/2019 12:12:12.12', 'true');

-- Problem 9
ALTER TABLE Users
DROP CONSTRAINT [PK__Users__3214EC07DDE8CFC8];

ALTER TABLE Users
ADD CONSTRAINT PK_Users_CompositeIdUsername
PRIMARY KEY(Id, Username);

-- Problem 10
ALTER TABLE Users
ADD CONSTRAINT CK_Users_PasswordLength
CHECK(LEN([Password]) >= 5);

-- Problem 11
ALTER TABLE Users
ADD CONSTRAINT DF_Users_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime;

-- Problem 12
ALTER TABLE Users
DROP CONSTRAINT PK_Users_CompositeIdUsername;

ALTER TABLE Users
ADD CONSTRAINT PK_Users_Id
PRIMARY KEY(Id);

ALTER TABLE Users
ADD CONSTRAINT CK_Users_UsernameLength
CHECK(LEN(Username) >= 3);