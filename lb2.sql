USE Anime
GO
----------------------------------------------
----------------------------------------------
--------------INSERTING DATA PHASE------------
----------------------------------------------
-------------also update and delete-----------
----------------------------------------------

--->Directors

-- Inserting data into table directors
INSERT INTO Directors(DID, DirectorName) VALUES (1, 'Nagahama Hiroshi')
INSERT INTO Directors(DID, DirectorName) VALUES (2, 'Nagai Tatsuyuki')
INSERT INTO Directors(DID, DirectorName) VALUES (3, 'Nagahama Hiroshi')
INSERT INTO Directors(DID, DirectorName) VALUES (4, 'Irie Yasuhiro')
INSERT INTO Directors(DID, DirectorName) VALUES (5, 'Sueda Yoshifumi')
INSERT INTO Directors(DID, DirectorName) VALUES (6, 'Takemoto Yasuhiro')
INSERT INTO Directors(DID, DirectorName) VALUES (7, 'Matsumoto Rie')
INSERT INTO Directors(DID, DirectorName) VALUES (8, 'Nagahama Hiroshi')
INSERT INTO Directors(DID, DirectorName) VALUES (9, 'Yamada Naoko')
INSERT INTO Directors(DID, DirectorName) VALUES (10, 'Yamaguchi Yuuji')
INSERT INTO Directors(DID, DirectorName) VALUES (11, 'Hideaki Anno')
INSERT INTO Directors(DID, DirectorName) VALUES (12, 'Kyogoku Takahiro')
INSERT INTO Directors(DID, DirectorName) VALUES (13, 'Nagasaki, Kenji')

--Error in the next one, repeating primary key
INSERT INTO Directors(DID, DirectorName) VALUES (7, 'Kurusu Akira')--->Violation of PRIMARY KEY constraint 'PK__Composer__C1F8DC595772F790'. Cannot insert duplicate key in object 

--Check if data was added correctly
SELECT * FROM Directors

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->Studios

--Inserting data into table Studios
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (1, 'Kyoto Animation', 'Yoko Hatta', 300000)
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (2, 'Ufotable', 'Matsuri Ouse', 200000) 
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (3, 'Orange', ' Eiji Inomoto', 90000) 
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (5, 'Artland', 'Kuniharu Okano', 100000) 
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (4, 'Bones', ' Masahiko Minami', 700000) 
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (6, 'Sunrise', 'Yasuo Miyakawa', 800000) 

---Error in the next one, another primary key constraint violation and a fild type violation
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (1, 77, 'Akechi Goro', 300000)--->Violation of PRIMARY KEY constraint 'PK__Composer__C1F8DC595772F790'. Cannot insert duplicate key in object 

---See all data of Studios
SELECT* FROM Studios

----------------
---Updating/DEleting data
--will use dummy table entries
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (9, 'Crow', 'Akechi Goro', 70)
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (10, 'Joker', 'Kurusu Akira', 90)
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (97, 'Loki', 'Akechi Kogoro', 40)
INSERT INTO Studios(STID, StudioName, Founder, YearlyGrossing) VALUES (100, 'Robin Hood', 'Akechi Kogoro', 45)
---update data
UPDATE Studios
SET StudioName = 'Arsene'
WHERE YearlyGrossing BETWEEN 7 AND 77
SELECT* FROM Studios
---delete data
DELETE FROM Studios
WHERE YearlyGrossing in (40, 45, 70, 90)
SELECT* FROM Studios
----------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->Manga

--Inserting data into table Manga
INSERT INTO Manga(MID, Title, Author) VALUES (1, 'Fullmetal Alchemist', 'Hiromu Arakawa')
INSERT INTO Manga(MID, Title, Author) VALUES (2, 'Mushishi', 'Yuki Urushibara')
INSERT INTO Manga(MID, Title, Author) VALUES (3, 'Kekkai Sensen', 'Yasuhiro Nightow')
INSERT INTO Manga(MID, Title, Author) VALUES (4, 'Hyouka', 'Honobu Yonezawa')
INSERT INTO Manga(MID, Title, Author) VALUES (5, 'Houseki no kuni', 'Haruko Ichikawa')
INSERT INTO Manga(MID, Title, Author) VALUES (6, 'My hero academia', 'Kohei Horikoshi')

---Primary key contraint check
INSERT INTO Manga(MID, Title, Author) VALUES (2, 'Mushishi', 'Akechi Goro')--->Violation of PRIMARY KEY constraint 'PK__Composer__C1F8DC595772F790'. Cannot insert duplicate key in object 

--See all data of Manga
SELECT* FROM Manga

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->VoiceActors

--Inserting data into table voiceActors
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (1, 'Nakano Yuto', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (2, 'Doi Mika', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (3, 'Sakaguchi Daisuke', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (4, 'Nakai Kazuya', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (5, 'Kobayashi Yuu', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (6, 'Nakamura Yuuichi', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (7, 'Sato Satomi', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (8, 'Kayano Ai', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (9, 'Park Romi', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (10, 'Kugimiya Rie', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (11, 'Miki Shinichiro', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (12, 'Orikasa Fumiko', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (14, 'Yamashita Daiki', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (15, 'Kaji Yuki', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (16, 'Miyake Kenta', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (13, 'Yuuki Aoi', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (17, 'Ookawa Tooru', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (18, 'Neya Michiko', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (19, 'Kawasumi Ayako', 'Female')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (20, 'Canna Nobutoshi', 'Male')
INSERT INTO VoiceActors(VAID, ActorName, Gender) VALUES (21, 'Yamadera Kouichi', 'Male')

----Primary key constraint restriction check
INSERT INTO VoiceActors(VAID, ActorName) VALUES (1, 'Akechi Goro')--->Violation of PRIMARY KEY constraint 'PK__Composer__C1F8DC595772F790'. Cannot insert duplicate key in object 

--See all data of VoiceActors
SELECT* FROM VoiceActors

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->Composers

--Inserting data into composers
INSERT INTO Composers(CID, ComposeName) VALUES (1, 'Masuda Toshio')
INSERT INTO Composers(CID, ComposeName) VALUES (2, 'Iwasaki Taisei')
INSERT INTO Composers(CID, ComposeName) VALUES (3, 'Yuuki Hayashi')
INSERT INTO Composers(CID, ComposeName) VALUES (4, 'Kohei Tanaka')
INSERT INTO Composers(CID, ComposeName) VALUES (5, 'Fukasawa Hideyuki')
INSERT INTO Composers(CID, ComposeName) VALUES (6, 'Akira Senju')
INSERT INTO Composers(CID, ComposeName) VALUES (7, 'Yoshiaki Fujisawa')
INSERT INTO Composers(CID, ComposeName) VALUES (8, 'Yoko Kanno')

---Primary key check
INSERT INTO Composers(CID, ComposeName) VALUES (7, 'Akechi Goro')--->Violation of PRIMARY KEY constraint 'PK__Composer__C1F8DC595772F790'. Cannot insert duplicate key in object 

--See all data of Composers
SELECT* FROM Composers

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---->Anime

--Inserting data into Anime
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (1, 'Mushishi', 0, 76, 2, 9, 5)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (2, 'My hero academia', 0, 65, 6, 8, 4)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (3, 'Hyouka', 0, 25, 4, 9, 1)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (4, 'Houseki no kuni', 0, 24, 5, 8, 3)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (5, 'Fullmetal alchemist', 0, 35, 1, 8, 4)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (6, 'Fullmetal alchemist brotherhood', 0, 85, 1, 8, 4)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (7, 'Kekkai Sensen', 0, 50, 3, 8, 4)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (8, 'Fate/stay night: unlimited bladeworks', 0, 40, null, 8, 4)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (9, 'Cowbboy Bebop', 0, 26, null, 10, 6)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (10, 'Evanghelion: 1.0 You are (not) alone', 1, 1, null, 7, 6)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (11, 'Evanghelion: 2.0 You can (not) advance', 1, 1, null, 6, 6)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (12, 'Evanghelion: 3.0 You can (not) redo', 1, 1, null, 8, 6)


----Primary key constraint violation
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (1, 'Persona 5', 0, 76, 2, 9, 5)
--->Violation of PRIMARY KEY constraint 'PK__Composer__C1F8DC595772F790'. Cannot insert duplicate key in object 
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (13, 'Persona 5', 0, 'An amount of episodes', 2, 9, 5)
---->Conversion failed when converting the varchar value 'An amount of episodes' to data type int.

--See all data of Table Anime
SELECT* FROM Anime

----------------
--Updating/Deleting data of table Anime
--Will use a dummy entry 
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (13, 'Persona 5', 0, 76, 2, 9, 5)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (14, 'Persona 5', 0, 76, 2, 9, 5)
INSERT INTO Anime(AID, Title, Movie, EpisodeCount, MID, Rating, STID) VALUES (14, 'Persona 5', 0, 76, null, 9, 5)
---Update data
UPDATE Anime
SET EpisodeCount = 26
WHERE Title = 'Persona 5'
SELECT* FROM Anime
---Update data
UPDATE Anime
SET MID = null
WHERE Title = 'Persona 5' AND MID IS NOT NULL
SELECT* FROM Anime
---Delete dummy entries
DELETE FROM Anime
WHERE Title = 'Persona 5'
SELECT* FROM Anime
----------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->DirectsAnime

---Inserting data into intermediary table DirectsAnime
INSERT INTO DirectsAnime(DID, AID) VALUES (1, 1)
INSERT INTO DirectsAnime(DID, AID) VALUES (2, 1)
INSERT INTO DirectsAnime(DID, AID) VALUES (3, 1)
INSERT INTO DirectsAnime(DID, AID) VALUES (4, 6)
INSERT INTO DirectsAnime(DID, AID) VALUES (4, 5)
INSERT INTO DirectsAnime(DID, AID) VALUES (4, 9)
INSERT INTO DirectsAnime(DID, AID) VALUES (5, 6)
INSERT INTO DirectsAnime(DID, AID) VALUES (6, 3)
INSERT INTO DirectsAnime(DID, AID) VALUES (7, 7)
INSERT INTO DirectsAnime(DID, AID) VALUES (9, 7)
INSERT INTO DirectsAnime(DID, AID) VALUES (10, 8)
INSERT INTO DirectsAnime(DID, AID) VALUES (12, 2)
INSERT INTO DirectsAnime(DID, AID) VALUES (13, 2)
INSERT INTO DirectsAnime(DID, AID) VALUES (11, 10)
INSERT INTO DirectsAnime(DID, AID) VALUES (11, 11)
INSERT INTO DirectsAnime(DID, AID) VALUES (11, 12)

----Primary key constraint violation check
INSERT INTO DirectsAnime(DID, AID) VALUES (7, 7)--->Violation of PRIMARY KEY constraint 'pk_Directs'. Cannot insert duplicate key in object

---See all data
SELECT* FROM DirectsAnime

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->ActingInAnime

---Inserting data into intermediary table ActingInAnime
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(1, 1, 10)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(1, 2, 9)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(9, 2, 8)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(3, 3, 7)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(7, 4, 6)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(6, 4, 1)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(7, 5, 5)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(3, 6, 4)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(3, 7, 3)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(3, 8, 2)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(5, 9, 11)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(6, 9, 11)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(5, 10, 12)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(6, 10, 12)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(6, 11, 13)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(5, 17, 13)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(6, 12, 14)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(5, 18, 14)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(4, 9, 15)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(2, 14, 16)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(2, 15, 17)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(2, 16, 18)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(2, 13, 19)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(8, 19, 20)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(8, 20, 21)
INSERT INTO ActingInAnime(AID, VAID, CHID) VALUES(9, 21, 22)

--See all data
SELECT* FROM ActingInAnime

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->Characters

---Inserting data into intermediary table Characters
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (1, 'Miles', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (2, 'Ibara Mayaka', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (3, 'Chitanda Eru', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (4, 'Oreki Houtarou', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (5, 'Sumeragi Chain', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (6, 'Renfro Zapp', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (7, 'Fukube Satoshi', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (8, 'Alisa', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (9, 'Nui', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (10, 'Ginko', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (11, 'Edward Elric', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (12, 'Alphonse Elric', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (13, 'Roy Mustang', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (14, 'Riza Hawkeye', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (15, 'Padparadscha', 'None')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (16, 'Midorya Izuku', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (17, 'Todoroki Shouto', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (18, 'ALL MIGHTO', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (19, 'Asui Tsuiu', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (20, 'Saber - Altria Pendragon', 'Female')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (21, 'Lancer - Cu Chulainn', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (22, 'Spike Spigel', 'Male')

--See all data
SELECT* FROM Characters

----------------
---Update/Delete Data
--will use dummy entry
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (24, 'Kurusu Akira', 'Male')
INSERT INTO Characters(CHID, CharacterName, Gender) VALUES (25, 'Morgana', 'Female')
---Updating data
UPDATE Characters
SET Gender = 'Male'
WHERE CharacterName = 'Morgana'
SELECT* FROM Characters
---Updating data
UPDATE Characters
SET CharacterName = 'Joker'
WHERE CharacterName LIKE '%kira'
SELECT* FROM Characters
----Deleting dummy data
DELETE FROM Characters
WHERE CharacterName = 'Joker' OR CharacterName = 'Morgana'
SELECT* FROM Characters
----------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--->OST

--Inseting data into OST (finally)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (1, '00:03:16', 'Instrumental', 'Fullmetal Alchemist Original Soundtrack Vol 2', 6)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (2, '00:02:45', 'Classical', 'Hyouka OST Original Sountrack 1', 4)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (3, '00:03:23', 'Classical', 'Hyouka OST Original Sountrack 2', 4)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (4, '00:01:12', 'Instrumental', 'Hyouka OST Original Sountrack 1', 4)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (5, '00:03:06', 'Jazz', 'Blood Blockade Battlefront Original Series OST', 2)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (6, '00:12:49', 'Hip Hop', 'Blood Blockade Battlefront Original Series OST', 2)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (7, '00:04:51', 'Instrumental', 'Hyouka OST Original Sountrack 2', 4)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (8, '00:00:57', 'Jazz', 'Cowboy Bebop', 8)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (9, '00:34:15', 'Ambient Music', 'Mushishi Original Sountrack Vol 1', 1)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (10, '00:45:00', 'Ambient Music', 'Mushishi Original Sountrack', 1)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (11, '00:05:16', 'Folk Rock', 'Fullmetal Alchemist Original Soundtrack', 6)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (12, '00:05:49', 'Instrumental', 'Fullmetal Alchemist Original Soundtrack', 6)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (13, '00:04:09', 'Instrumental', 'Fullmetal Alchemist Original Soundtrack Vol 1', 6)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (14, '00:08:17', 'Instrumental', 'Fullmetal Alchemist Original Soundtrack Vol 2', 6)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (15, '01:02:56', 'Ambient Music', '"Land of the Lustrous (Anime)" Original Soundtrack', 7)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (16, '00:06:19', 'Pop Rock', 'My Hero Academia Original Sountrack Vol 1', 3)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (17, '00:03:48', 'Pop Rock', 'My Hero Academia 2nd Season Original Sountrack', 3)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (18, '00:01:19', 'Pop Rock', 'My Hero Academia Original Sountrack Vol 1', 3)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (19, '00:00:23', 'Pop Rock', 'My Hero Academia Original Sountrack Vol 2', 3)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (20, '00:06:58', 'Folk Rock', 'Fate/stay night Unlimited Bladeworks OST', 5)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (21, '00:01:05',  'Irish Rock', 'Fate/stay night Unlimited Bladeworks OST VOL 2', 5)
INSERT INTO OST(CHID, Lengthy, Genre, Album, CID) VALUES (22, '01:05:18', 'Jazz', 'Cowboy Bebop Vitaminless', 8)

--See all data
SELECT* FROM OST



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
---------------------------------------DATA INTEROGATION PHASE--------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

---arithmetic expressions in the SELECT clause
--compute a procent
SELECT Title, (Rating*100)/10 as Procent
FROM Anime

--play around with the episode count
SELECT Title, (EpisodeCount*70 + 7)/77 as Procent
FROM Anime

--play around with yearlygrossing
SELECT StudioName, 7+YearlyGrossing
FROM Studios
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--a.queries with UNION[ALL] or OR

---all songs of either Instrumental or Classical genre + One TOP
SELECT TOP 5 * FROM OST
WHERE Genre = 'Instrumental' OR Genre = 'Classical'

---all songs that are either Amibient music or longer than one hour
SELECT* FROM OST
WHERE Genre = 'Ambient Music'
UNION
SELECT* FROM OST
WHERE Lengthy > '01:00:00'

----all anime (Titles) that have a rating higher than 8 or have fewer than 50 episodes but are not a movie
SELECT a1.Title
FROM Anime a1
WHERE Rating > 8
UNION
SELECT a2.Title
FROM Anime a2
WHERE EpisodeCount < 50 AND Movie = 0

---all characters that are either female or genderless
SELECT c.CharacterName
FROM Characters c
WHERE Gender = 'Female' OR Gender = 'None'

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--b.queries with INTERSECT and IN

---all female voice actors that have names longer than 7 characters + one TOP
SELECT TOP 5 v1.ActorName
FROM VoiceActors v1
WHERE Gender = 'Female'
INTERSECT
SELECT v2.ActorName
FROM VoiceActors v2
WHERE LEN(ActorName) > 7

---all anime movies that have a rating lower than 8
SELECT* FROM Anime
WHERE Movie = 1
INTERSECT
SELECT* FROM Anime
WHERE Rating IN (1,2,3,4,5,6,7)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---c.queries with EXCEPT and NOT IN

--all anime that have a rating higher or equalto 8, are not movies but have more than 50 episodes
SELECT a.Title
FROM Anime a
WHERE Rating >= 8 AND Movie = 0
EXCEPT
SELECT a2.Title
FROM Anime a2
WHERE EpisodeCount <= 50

---all manga that start with H but have less than 10 characters in their title
SELECT* FROM Manga
WHERE Title LIKE 'H%'
EXCEPT
SELECT* FROM Manga
WHERE LEN(Title) >= 10

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---d. queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN

---all female voice actors and how many roles they played
SELECT v2.ActorName, COUNT(act.CHID) as Roles
FROM VoiceActors v2 INNER JOIN ActingInAnime act ON v2.VAID = act.VAID 
WHERE Gender = 'Female'
GROUP BY v2.ActorName

---all female actors that played male/genderless characters --->Join of three or more tables
SELECT DISTINCT v.ActorName
FROM VoiceActors v LEFT JOIN ActingInAnime act ON v.VAID = act.VAID LEFT JOIN Characters c ON act.CHID = c.CHID
WHERE c.Gender = 'Male' OR c.Gender = 'None'

---all people that have worked for studio Bones
SELECT DISTINCT v.ActorName AS People
FROM Anime a RIGHT JOIN Studios s ON a.STID = s.STID 
		RIGHT JOIN ActingInAnime act ON a.AID = act.AID RIGHT JOIN VoiceActors v ON act.VAID = v.VAID 
WHERE s.StudioName = 'Bones'
UNION
SELECT DISTINCT d.DirectorName
FROM Directors d RIGHT JOIN DirectsAnime da ON d.DID = da.DID RIGHT JOIN Anime a ON da.AID = a.AID RIGHT JOIN Studios s ON a.STID = s.STID
WHERE s.StudioName = 'Bones'
UNION
SELECT DISTINCT c.ComposeName
FROM Anime a RIGHT JOIN Studios s ON a.STID = s.STID 
		RIGHT JOIN ActingInAnime act ON a.AID = act.AID RIGHT JOIN Characters ch ON act.CHID = ch.CHID RIGHT JOIN OST o ON o.CHID = ch.CHID
				RIGHT JOIN Composers c ON o.CID = c.CID
WHERE s.StudioName = 'Bones'

---all directors that have worked with Park Romi ----> Join of two many-to-many relationships
SELECT DISTINCT d.DirectorName
FROM Directors d FULL JOIN DirectsAnime da ON d.DID = da.DID FULL JOIN Anime a ON da.AID = a.AID FULL JOIN ActingInAnime act ON a.AID = act.AID
		FULL JOIN VoiceActors v ON act.VAID = v.VAID
WHERE v.ActorName = 'Park Romi' AND d.DirectorName IS NOT NULL

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---e. queries where the IN operator introduces a subquery in the WHERE clause

---all authors of manga that have had adaptations spanning 20 or more episodes --->WHERE in the subquery
SELECT m.Author
FROM Manga m
WHERE m.MID IN ( SELECT a.MID FROM Anime a
WHERE a.MID = m.MID AND a.EpisodeCount >= 20)

---all studios that have relesed anime movies
SELECT s.STID, s.StudioName
FROM Studios s
WHERE s.STID IN (SELECT a.STID FROM Anime a
WHERE a.Movie = 1)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---f. queries using the EXISTS operator to introduce a subquery in the WHERE clause

---all authors of manga that have had adaptations rated 9 or 10
SELECT m.Author
FROM Manga m
WHERE EXISTS ( SELECT * FROM Anime a
WHERE a.MID = m.MID AND a.Rating >= 9)

---all studios that have relesed anime movies
SELECT s.STID, s.StudioName
FROM Studios s
WHERE EXISTS (SELECT * FROM Anime a
WHERE a.Movie = 1 AND a.STID = s.STID)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---g. queries with a subquery in the FROM clause

---all composers that have composed music in any Rock genre
SELECT DISTINCT R.ComposeName, R.Genre
FROM ( SELECT c.ComposeName, o.Genre
FROM Composers c INNER JOIN OST o ON c.CID = o.CID
WHERE o.Genre LIKE '%Rock'
) R

--all characters that have ost in the Instrumental genre
SELECT DISTINCT R.CharacterName, R.Genre
FROM( SELECT DISTINCT ch.CharacterName, o.Genre, a.Title
FROM Characters ch INNER JOIN OST o ON ch.CHID = o.CHID INNER JOIN ActingInAnime act ON ch.CHID = act.CHID INNER JOIN Anime a ON act.AID = a.AID
WHERE o.Genre = 'Instrumental'
) R

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---h.queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 2 of the latter will also have a subquery in the HAVING clause

---all studios with the number of anime they relased --->+ one ORDER BY
SELECT s.StudioName, COUNT(a.AID) AS NoOfAnime
FROM Studios s INNER JOIN Anime a ON a.STID = s.STID
GROUP BY s.StudioName
ORDER BY COUNT(a.AID)

---all studios with more than 2 relased anime
SELECT s.StudioName, COUNT(a.AID) AS NoOfAnime
FROM Studios s INNER JOIN Anime a ON a.STID = s.STID
GROUP BY s.StudioName
HAVING COUNT(a.AID) >= 2

---all composers that on average have composed songs that are longer than the average ost length
SELECT c.ComposeName, CAST(DATEADD(ss,AVG(DATEDIFF(ss, 0, o.Lengthy)), 0) AS TIME) as Average --casting time field to number, done here in seconds
FROM Composers c INNER JOIN OST o ON c.CID = o.CID
GROUP BY c.ComposeName
HAVING  CAST(DATEADD(ss,AVG(DATEDIFF(ss, 0, o.Lengthy)), 0) AS TIME) > (SELECT  CAST(DATEADD(ss,AVG(DATEDIFF(ss, 0, Lengthy)), 0) AS TIME) FROM OST)
ORDER BY c.ComposeName

---all Directors that have the average rating of the anime they directed less than the average rating (if there are any, show their maximum rating)
SELECT d.DirectorName, MAX(a.Rating) as MaxRating
FROM Directors d INNER JOIN DirectsAnime da ON da.DID = d.DID INNER JOIN Anime a ON a.AID = da.AID
GROUP BY d.DirectorName
HAVING AVG(a.Rating) < (SELECT AVG(Rating) FROM Anime)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---i.queries using ANY and ALL to introduce a subquery in the WHERE clause; 2 of them should be rewritten with aggregation operators, while the other 2 should also be expressed with [NOT] IN

--all anime that have the maximum number of episodes
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount > ALL(SELECT a1.EpisodeCount FROM Anime a1
WHERE a.AID = a1.AID)

---rewritten with max
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount > (SELECT MAX(a1.EpisodeCount) FROM Anime a1
WHERE a.AID = a1.AID)

---all anime that have the minimum number of episodes
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount < ANY(SELECT a1.EpisodeCount FROM Anime a1
WHERE a.AID = a1.AID)

---rewritten with MIN
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount < (SELECT MIN(a1.EpisodeCount) FROM Anime a1
WHERE a.AID = a1.AID)

---all anime that have more than 50 episodes
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount <>ALL(SELECT a1.EpisodeCount FROM Anime a1
WHERE a.AID = a1.AID AND a1.EpisodeCount < 50)

---rewrite with NOT IN
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount NOT IN (SELECT a1.EpisodeCount FROM Anime a1
WHERE a.AID = a1.AID AND a1.EpisodeCount < 50)

---all anime that have less than 50 episodes
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount =ANY(SELECT a1.EpisodeCount FROM Anime a1
WHERE a.AID = a1.AID AND a1.EpisodeCount < 50)

---rewrite with IN
SELECT a.Title, a.EpisodeCount
FROM Anime a
WHERE a.EpisodeCount IN (SELECT a1.EpisodeCount FROM Anime a1
WHERE a.AID = a1.AID AND a1.EpisodeCount < 50)