USE Anime
GO
---------creating the tables that i shall mercilessly torture 
DROP TABLE BelongsTo
DROP TABLE GameCharacters
DROP TABLE VideoGames
CREATE TABLE VideoGames( --tb
[VID] INT PRIMARY KEY IDENTITY,---bid
[Title] VARCHAR(50),
RelaseYear INT  ---b2
)

CREATE TABLE GameCharacters( --ta
[GCID] INT PRIMARY KEY IDENTITY, --ai
Name VARCHAR(50),
[Age] INT UNIQUE,----a2
isEvil VARCHAR(3) CHECK(isEvil='Yes' OR isEvil='No')
)

CREATE TABLE BelongsTo(---tc
BID INT PRIMARY KEY IDENTITY, --cid
VID INT FOREIGN KEY REFERENCES VideoGames(VID), ---aid
GCID INT FOREIGN KEY REFERENCES GameCharacters(GCID),---bid
Protagonist BIT DEFAULT 0
)

INSERT INTO VideoGames VALUES ('Persona 5', 2016), ('Persona 5 Royal', 2019)
INSERT INTO GameCharacters VALUES ('Kurusu Akira', 17, 'No'), ('Akechi Goro', 18, 'Yes'), ('Sakura Futaba', 15, 'No')
INSERT INTO BelongsTo VALUES (1, 1, 1), (1, 2, 0), (1, 3, 0), (2, 1, 1), (2, 2, 1), (2, 3, 0)
SELECT * FROM VideoGames
SELECT * FROM GameCharacters
SELECT * FROM BelongsTo
-----------------------let's go-------------------------------------------------

SELECT @@VERSION-----DE CE E 2008??? ANUL ASTA L-AM INSTALAT....--------->guess i'll update the version

----check non clustered indexes
SELECT TableName = t.name, IndexName = ind.name, IndexId = ind.index_id, ColumnId = ic.index_column_id, ColumnName = col.name, ind.*, ic.*, col.*
FROM sys.indexes ind 
INNER JOIN sys.index_columns ic ON ind.object_id = ic.object_id and ind.index_id = ic.index_id
INNER JOIN sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id
INNER JOIN sys.tables t ON ind.object_id = t.object_id
WHERE ind.is_primary_key = 0 AND ind.is_unique = 0 AND ind.is_unique_constraint = 0 AND t.is_ms_shipped = 0
ORDER BY t.name, ind.name, ind.index_id, ic.index_column_id;

---check indexes for table GameCharacters
SELECT i2.name, i1.user_scans, i1.user_seeks, i1.user_updates,i1.last_user_scan,i1.last_user_seek, i1.last_user_update
FROM sys.dm_db_index_usage_stats i1
INNER JOIN sys.indexes i2 on i1.index_id = i2.index_id
WHERE i1.object_id = OBJECT_ID('GameCharacters') and i1.object_id = i2.object_id

---aaaaaand all indexes in this database
SELECT OBJECT_NAME(A.[OBJECT_ID]) AS [OBJECT NAME], I.[NAME] AS [INDEX NAME], A.LEAF_INSERT_COUNT, A.LEAF_UPDATE_COUNT, A.LEAF_DELETE_COUNT 
FROM SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,NULL,NULL,NULL ) A INNER JOIN SYS.INDEXES AS I ON I.[OBJECT_ID] = A.[OBJECT_ID] AND I.INDEX_ID = A.INDEX_ID 
WHERE OBJECTPROPERTY(A.[OBJECT_ID],'IsUserTable') = 1

--a. Write queries on Ta such that their execution plans contain the following operators

--clustered index scan---> see all evil characters
SELECT G.Name, G.GCID
FROM GameCharacters G
WHERE isEvil = 'Yes'

---clustered index seek----> character that has the id 2
SELECT G.Name, G.GCID
FROM GameCharacters G
WHERE G.GCID = 2

----non-clustered index scan

SELECT G.Age
FROM GameCharacters G

---non-clustered index seek
SELECT G.GCID
FROM GameCharacters G
WHERE Age > 16

---key lookup
SELECT *
FROM GameCharacters
WHERE Age>16

--b. Write a query on table Tb with a WHERE clause of the form WHERE b2 = value and analyze its execution plan. 
--Create a nonclustered index that can speed up the query. Recheck the query’s execution plan (operators, SELECT’s estimated subtree cost).
SELECT VID
FROM VideoGames
WHERE RelaseYear = 2019

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'NonClustIdx_RelaseYear') 
DROP INDEX NonClustIdx_RelaseYear ON VideoGames 
GO

CREATE NONCLUSTERED INDEX NonClustIdx_RelaseYear ON VideoGames(RelaseYear) 
GO

--c. Create a view that joins at least 2 tables. Check whether existing indexes are helpful; if not, reassess existing indexes / examine the cardinality of the tables.
CREATE VIEW index_view AS
SELECT G.GCID, G.Name
FROM GameCharacters G INNER JOIN BelongsTo Bt ON G.GCID = Bt.GCID
GO

SELECT * FROM index_view
WITH(INDEX(NonClustIdx_RelaseYear))

CREATE UNIQUE NONCLUSTERED INDEX [IDX_NCL_GameCharacterID] ON BelongsTo(GCID, VID)
DROP index IDX_NCL_GameCharacterID ON BelongsTo
GO


SELECT * FROM index_view
WITH(INDEX(IDX_NCL_GameCharacterID))

