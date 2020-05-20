USE Anime
GO

---Keep the current version of the database in a separate table
DROP TABLE CurrentVersion
CREATE TABLE CurrentVersion(
DatabaseVersion INT)
---Initialise the current version of the database
INSERT INTO CurrentVersion(DatabaseVersion) values (0)

---tables to keep all possible stored procedure names --->one for changes to versions, one for reverting
CREATE TABLE Versions(
	Vers INT,
	VersName VARCHAR(50)
)

INSERT INTO Versions(Vers, VersName) VALUES (1,'version1'), (2, 'version2'), (3, 'version3'), (4, 'version4'), (5, 'version5'), (6, 'version6'), (7, 'version7')

CREATE TABLE ReverseVersions(
Rvid INT, 
RvrsName VARCHAR(50))
insert into ReverseVersions(Rvid, RvrsName) values (1, 'reverse1'), (2, 'reverse2'), (3, 'reverse3'), (4, 'reverse4'), (5, 'reverse5'), (6, 'reverse6'), (7, 'reverse7')

----Create procedure to update database to version 1. As in, modify a colum + reverse that
CREATE PROCEDURE version1 AS
BEGIN
ALTER TABLE Anime
ALTER COLUMN EpisodeCount INT NOT NULL
END
GO

EXEC version1

---reversion of version1
CREATE PROCEDURE reverse1 AS
BEGIN
AlTER TABLE Anime
ALTER COLUMN EpisodeCount INT
END
GO

EXEC reverse1

---Create a procedure to update table to version 2 + its reverse
--It Adds a column
CREATE PROCEDURE version2 AS
BEGIN
ALTER TABLE Manga
ADD Genre VARCHAR(100)
END
GO

EXEC version2

---reverse of version2
CREATE PROCEDURE reverse2 AS
BEGIN
ALTER TABLE Manga
DROP COLUMN Genre
END
GO

EXEC reverse2

---Create a procedure to update table to version 3 + its reverse
--adds default constraint to a table
CREATE PROCEDURE version3 AS
BEGIN
ALTER TABLE Anime
ADD CONSTRAINT defaultTitle DEFAULT 'Persona 5' FOR Title
END
GO

EXEC version3

---reverse of version3
CREATE PROCEDURE reverse3 AS
BEGIN
ALTER TABLE Anime
DROP CONSTRAINT defaultTitle
END
GO

EXEC reverse3

---Create a procedure to update database to version 4 + its reverse
--create primary key constraint--->add a new table for that. wouldn't want to ruin all that data
CREATE PROCEDURE version4 AS
BEGIN 
CREATE TABLE Games(
Title VARCHAR(100) NOT NULL,
Genre VARCHAR(50),
CONSTRAINT pk_games PRIMARY KEY(Title))
END
GO

EXEC version4
SELECT * FROM Games

--reverse of version4
CREATE PROCEDURE reverse4 AS
BEGIN
ALTER TABLE Games 
DROP CONSTRAINT pk_games
DROP TABLE Games
END
GO

EXEC reverse4

---Create a procedure to update the databaseto version 5 + the reverse proceure
--introduce a candidate key constraint
CREATE PROCEDURE version5 AS
BEGIN
ALTER TABLE Anime 
ADD CONSTRAINT ck_anime UNIQUE (Title)
END
GO

EXEC version5

--reverse of version5
CREATE PROCEDURE reverse5 AS
BEGIN
ALTER TABLE Anime
DROP CONSTRAINT ck_anime
END
GO

EXEC reverse5

--Create a procedure to update the database to version 6 + its reverse
--adding a foreign key
CREATE PROCEDURE version6 AS
BEGIN
ALTER TABLE Manga
ADD STID INT CONSTRAINT ST_const DEFAULT 1 NOT NULL
ALTER TABLE Manga
ADD CONSTRAINT fk_manga FOREIGN KEY(STID) REFERENCES Studios(STID)
END
GO

EXEC version6

---reverse of version6
CREATE PROCEDURE reverse6 AS
BEGIN
ALTER TABLE Manga DROP CONSTRAINT ST_const
ALTER TABLE Manga DROP CONSTRAINT fk_manga
ALTER TABLE Manga DROP COLUMN STID
END
GO

EXEC reverse6

---Create a procedure to update the databaze to version 7 + reverse it
--add anew table
CREATE PROCEDURE version7 AS
BEGIN
CREATE TABLE Games1(
Title VARCHAR(100) NOT NULL,
Genre VARCHAR(50))
END
GO

EXEC version7

--reverse version7
CREATE PROCEDURE reverse7 AS
BEGIN
DROP TABLE Games1
END
GO

EXEC reverse7


-----Main method for all of this, will update the version of the database accordingly
--gets as input the desired version of the database 
CREATE PROCEDURE updateMain (@ver INT) AS
BEGIN
IF @ver < 0 BEGIN
PRINT('Can you not pick a number from 0 to 7...?')
END
ELSE BEGIN
IF @ver>7 BEGIN
PRINT('Can you not pick a number from 0 to 7...?')
END
ELSE BEGIN
DECLARE @currentVer INT
SET @currentVer = (SELECT MAX(DatabaseVersion) FROM CurrentVersion)
----declaring variable that will be used to call the appropriate procedure
DECLARE @command VARCHAR(50)
IF @currentVer <= @ver BEGIN
	WHILE @currentVer < @ver BEGIN
		SET @currentVer = (@currentVer + 1)
		SET @command = (SELECT VersName FROM Versions WHERE Vers = @currentVer)
		EXEC @command
	END
END
ELSE BEGIN
	WHILE @currentVer > @ver BEGIN
	SET @command = (SELECT RvrsName FROM ReverseVersions WHERE Rvid = @currentVer)
	SET @currentVer = (@currentVer - 1)
	EXEC @command
	END
	SET @currentVer = @ver
END
UPDATE CurrentVersion SET DatabaseVersion = @currentVer
END
END
END
GO

---finally, test this monster of a procedure.. -.-
EXEC updateMain 6

SELECT * FROM CurrentVersion

EXEC reverse1
EXEC reverse2
EXEC reverse3
EXEC reverse4
EXEC reverse5
EXEC reverse6
EXEC reverse7