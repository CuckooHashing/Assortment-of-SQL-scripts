CREATE DATABASE DinoGame
GO

USE DinoGame

CREATE TABLE Species(
SPID INT PRIMARY KEY,
Name VARCHAR(20),
Description VARCHAR(20)
)

CREATE TABLE Islands(
IID INT PRIMARY KEY,
Name VARCHAR(20),
Area VARCHAR(20)
)

CREATE TABLE Users(
USID INT PRIMARY KEY,
Name VARCHAR(20) UNIQUE
)

CREATE TABLE Dinosaurs(
DID INT PRIMARY KEY,
Nickname VARCHAR(20),
Age INT,
Weight INT,
Height INT,
SPID INT FOREIGN KEY REFERENCES Species(SPID),
HappinessScore INT,
IID INT FOREIGN KEY REFERENCES Islands(IID),
USID INT FOREIGN KEY REFERENCES Users(USID)
)

DROP TABLE Dinosaurs

CREATE TABLE UserDinoInteraction(
UDID INT PRIMARY KEY,
StartTime DATETIME,
EndTime DATETIME,
USID INT FOREIGN KEY REFERENCES Users(USID),
DID INT FOREIGN KEY REFERENCES Dinosaurs(DID)
)

SELECT * FROM Dinosaurs

INSERT INTO Species VALUES (1, 'T-Rex', 'Big scary carnivore'), (2, 'Triceratops', 'Armoured herbivore'), (3, 'Raptor', 'fast carnivore')
INSERT INTO Islands VALUES (1, 'Dragon Island', 'Near the warm part'), (2, 'Herbivore island', 'center map'), (3, 'Mixed Island', 'Beginning zone')
INSERT INTO Users VALUES (1, 'PancakeSort'), (2, 'Flour'), (3, 'Some guy')
INSERT INTO Dinosaurs VALUES (1, 'Speedy', 12, 34, 45, 3, 23, 1, 1), (2, 'Scary', 10, 45, 56, 1, 45, 3, 1), (3, 'Dino1', 34, 343, 34, 2, 67, 3, 2), (4, 'Trish', 34, 454, 23, 2, 23, 2, 2)
INSERT INTO UserDinoInteraction VALUES (1, '2020-01-03 00:00:00', '2020-01-03 01:02:02', 1, 1), (2, '2020-01-04 04:05:00', '2020-02-04 04:10:02', 1, 2)  
INSERT INTO UserDinoInteraction VALUES (3, '2020-01-03 00:00:00', '2020-01-03 01:02:02', 2, 2)

SELECT* FROM Dinosaurs
SELECT * FROM Islands
SELECT* FROM Users
SELECT* FROM UserDinoInteraction
SELECT * FROM Species
-------------------------------------------------------------------------------->2
CREATE PROCEDURE deleteSpecies @speciesName VARCHAR(20)
AS
BEGIN
DELETE FROM UserDinoInteraction
WHERE DID = (SELECT d.DID FROM UserDinoInteraction ud INNER JOIN Dinosaurs d ON ud.DID = d.DID INNER JOIN Species s ON d.SPID = s.SPID WHERE s.Name = @speciesName)

DELETE FROM Dinosaurs
WHERE SPID = (SELECT MAX(SPID) FROM Species WHERE Name = @speciesName)

DELETE FROM Species 
WHERE Name = @speciesName
END
GO

EXEC deleteSpecies 'Raptor'

------------------------------------------------------------------------------->3
ALTER VIEW MostDinosIslands AS
SELECT isl.Name
FROM Islands isl
WHERE (isl.IID IN
(SELECT IID FROM Dinosaurs AS d GROUP BY IID HAVING (COUNT(*) >= ALL (SELECT COUNT(*) AS Number FROM Dinosaurs AS d2 GROUP BY IID)))
)
GO

SELECT * FROM MostDinosIslands

------------------------------------------------------------------------------->4
CREATE FUNCTION f1(@N INT) RETURNS TABLE AS RETURN
SELECT u.Name
FROM Users u INNER JOIN UserDinoInteraction ud ON u.USID = ud.USID
WHERE @N <= (SELECT COUNT(*) FROM (SELECT DISTINCT DID FROM UserDinoInteraction WHERE USID = u.USID) t1)  
GO

SELECT * FROM dbo.f1(1) AS UsersThatInteracted
