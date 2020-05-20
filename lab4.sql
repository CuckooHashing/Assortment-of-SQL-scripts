USE  Anime
GO


---creating insert procedures-->3 of them
----Insert into table with primary key ---->characters
CREATE PROCEDURE insertCharacters AS
BEGIN
DECLARE @RowCount INT
DECLARE @n INT
DECLARE @Name VARCHAR(60)
SET @RowCount = 1000
SET @n = 50
WHILE @n < @RowCount BEGIN
	SET @Name = 'Akechi Goro ' + CONVERT (VARCHAR(10), @n)
	INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (@n, @Name, 'Male')
	SET @n = @n+1
END
END
GO

SELECT * FROM Characters

---Insert into anime---> the two primary keys MID and STID will be given value 1
ALTER PROCEDURE insertAnime AS
BEGIN
DECLARE @RowCount INT
DECLARE @n INT
DECLARE @Name VARCHAR(60)
SET @RowCount = 1000
SET @n = 50
WHILE @n < @RowCount BEGIN
	SET @Name = 'Persona5 ROYAL ' + CONVERT (VARCHAR(10), @n)
	DECLARE @fk INT = (SELECT MAX(MID) FROM Manga) 
	INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (@n, @Name, 0, 25, @fk, 10, 1)
	SET @n = @n +1
END
END
GO

---Insert into ActingInAnime 
ALTER PROCEDURE insertActingInAnime AS
BEGIN
DECLARE @val INT = (SELECT MAX(VAID) FROM VoiceActors)
INSERT INTO ActingInAnime(AID, VAID, CHID) SELECT TOP 950 AID, VAID, CHID FROM Anime CROSS JOIN VoiceActors CROSS JOIN Characters WHERE AID>49 AND CHID >49
END
GO

---create delete procedures --> opposite of all inserts
--delete from characters
CREATE PROCEDURE deleteCharacters AS
BEGIN
DECLARE @RowCount INT
DECLARE @n INT
SET @RowCount = 1000
SET @n = 50
WHILE @n < @RowCount BEGIN
	DELETE FROM Characters WHERE CHID = @n
	SET @n = @n+1
END
END
GO

---delete from anime
CREATE PROCEDURE deleteAnime AS
BEGIN
DECLARE @RowCount INT
DECLARE @n INT
SET @RowCount = 1000
SET @n = 50
WHILE @n < @RowCount BEGIN
	DELETE FROM Anime WHERE AID = @n
	SET @n = @n+1
END
END
GO

--delete from ActingInAnime
ALTER PROCEDURE deleteActingInAnime AS
BEGIN
DELETE FROM ActingInAnime WHERE AID > 49 AND CHID > 49
END
GO

---create view procedures --->again, 3 of them
CREATE VIEW CharactersView AS
SELECT * FROM Characters
GO

CREATE VIEW AnimeView AS
SELECT a.Title, ch.CharacterName FROM Anime a INNER JOIN ActingInAnime va ON a.AID = va.AID INNER JOIN Characters ch ON va.CHID = ch.CHID 
GO

CREATE VIEW ActingView AS
SELECT a.Title, ch.CharacterName FROM Anime a INNER JOIN ActingInAnime va ON a.AID = va.AID INNER JOIN Characters ch ON va.CHID = ch.CHID 
WHERE VAID = 7
GROUP BY a.Title, ch.CharacterName
GO

CREATE PROCEDURE runViews @which INT AS 
BEGIN
	DECLARE @name VARCHAR(10) = (SELECT v.Name FROM Views v WHERE v.ViewID = @which)
	IF @name = 'CharacterView' BEGIN
		SELECT * FROM CharactersView
	END
	ELSE IF @name = 'AnimeView' BEGIN
		SELECT * FROM AnimeView
	END
	ELSE BEGIN
		SELECT * FROM ActingView
	END
END
GO

---inserting into test tables the relevant info
INSERT INTO Tables (Name) VALUES ('Characters'), ('Anime'), ('ActingInAnime')

INSERT INTO Views (Name) VALUES ('CharacterView'), ('AnimeView'), ('ActingView')---view names have no connection to the actual tables, they are just remnants of a bygone era

INSERT INTO Tests (Name) VAlUES ('insertCharacters'), ('insertAnime'), ('insertActingInAnime'), ('deleteCharacters'), ('deleteAnime'), ('deleteActingInAnime'), ('runViews')

INSERT INTO TestViews (TestID, ViewID) VALUES (7, 1), (7, 2), (7, 3)

INSERT INTO TestTables (TestID, TableID, NoOfRows, Position) VALUES (1, 1, 950, 1), (2, 2, 950, 2), (3, 3, 950, 3), (4, 1, 950, 1), (5, 2, 950, 2), (6, 3, 950, 3) 

SELECT * FROM Characters

-----------and the main procedure
CREATE PROCEDURE mainTests AS
BEGIN
	DECLARE @t1 DATETIME
	DECLARE @t2 DATETIME
	DECLARE @t3 DATETIME 
	DECLARE @desc VARCHAR(100)
	DECLARE @testCount INT = 3
	DECLARE @tableID INT
	DECLARE @viewID INT
	DECLARE @testID INT
	
	WHILE @testCount > 0 BEGIN
		SET @t1 = GETDATE()
		IF @testCount = 1 BEGIN
			EXEC deleteActingInAnime
			EXEC insertActingInAnime
			SET @desc = 'Running test for ActingInAnime'
			SET @tableID = 3
			SET @viewID = 3 
		END
		ELSE IF @testCount = 2 BEGIN
			EXEC deleteAnime
			EXEC insertAnime
			SET @desc = 'Running test for Anime'
			SET @tableID = 2
			SET @viewID = 2
		END
		ELSE BEGIN
			EXEC deleteCharacters
			EXEC insertCharacters
			SET @desc = 'Running test for Characters'
			SET @testID = 1
			SET @viewID = 1
		END
		SET @t2 = GETDATE()
		EXEC runViews @testCount
		SET @t3 = GETDATE()
		INSERT INTO TestRuns(Description, StartAt, EndAt) VALUES (@desc, @t1, @t2)
		DECLARE @whichTestRun INT = (SELECT MAX(TestRunID) FROM TestRuns)
		INSERT INTO TestRunTables(TestRunID, TableID, StartAt, EndAt) VALUES (@whichTestRun, @tableID, @t1, @t2)
		INSERT INTO TestRunViews(TestRunID, ViewID, StartAt, EndAt) VALUES (@whichTestRun, @viewID, @t2, @t1)

		SET @testCount = @testCount-1
	END

END
GO

EXEC mainTests
SELECT * FROM TestRuns
SELECT * FROM TestRunTables
SELECT * FROM TestRunViews

SELECT * FROM ActingInAnime
SELECT * FROM Anime
SELECT * FROM Characters
EXEC deleteCharacters
EXEC deleteActingInAnime
EXEC deleteAnime

