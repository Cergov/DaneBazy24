--Tworzenie bazy
Create Database Geo;
USE Geo;

--Tworzenie tabel geologicznych
CREATE TABLE GeoEon (
	id_eon INT PRIMARY KEY,
	nazwa_eon VARCHAR(255) 
);

CREATE TABLE GeoEra (
	id_era INT PRIMARY KEY,
	id_eon INT FOREIGN KEY REFERENCES GeoEon(id_eon),
	nazwa_era VARCHAR(255)
);

CREATE TABLE GeoOkres (
	id_okres INT PRIMARY KEY ,
	id_era INT FOREIGN KEY REFERENCES GeoEra(id_era),
	nazwa_okres VARCHAR(255)
);

CREATE TABLE GeoEpoka (
	id_epoka INT PRIMARY KEY,
	id_okres INT FOREIGN KEY REFERENCES GeoOkres(id_okres),
	nazwa_epoka VARCHAR(255)
);

CREATE TABLE GeoPietro (
	id_pietro INT PRIMARY KEY,
	id_epoka INT FOREIGN KEY REFERENCES GeoEpoka(id_epoka),
	nazwa_pietro VARCHAR(255)
);

--Wsadzenie danych
INSERT INTO GeoEon (id_eon, nazwa_eon) VALUES
	(1, 'Fanerozoik');

INSERT INTO GeoEra (id_era, id_eon, nazwa_era) VALUES
	(1, 1, 'Kenozoik'),
	(2, 1, 'Mezozoik'),
	(3, 1, 'Paleozoik');

INSERT INTO GeoOkres (id_okres, id_era, nazwa_okres) VALUES
	(1, 1, 'Czwartorzęd'),
	(2, 1, 'Neogen'),
	(3, 1, 'Paleogen'),
	(4, 2, 'Kreda'),
	(5, 2, 'Jura'),
	(6, 2, 'Trias'),
	(7, 3, 'Perm'),
	(8, 3, 'Karbon'),
	(9, 3, 'Dewon'),
	(10, 3, 'Sylur'),
	(11, 3, 'Ordowik'),
	(12, 3, 'Kambr');

INSERT INTO GeoEpoka (id_epoka, id_okres, nazwa_epoka) VALUES
	(1, 1, 'Holocen'),
	(2, 1, 'Plejstocen'),
	(3, 2, 'Pliocen'),
	(4, 2, 'Miocen'),
	(5, 3, 'Oligocen'),
	(6, 3, 'Eocen'),
	(7, 3, 'Paleocen'),
	(8, 4, 'Późna Kreda'),
	(9, 4, 'Wczesna Kreda'),
	(10, 5, 'Jura Późna'),
	(11, 5, 'Jura Środkowa'),
	(12, 5, 'Jura Wczesna'),
	(13, 6, 'Późny Trias'),
	(14, 6, 'Środkowy Trias'),
	(15, 6, 'Wczesny Trias'),
	(16, 7, 'Loping'),
	(17, 7, 'Gwadalup'),
	(18, 7, 'Cisural'),
	(19, 8, 'Pensylwan'),
	(20, 8, 'Missisip'),
	(21, 9, 'Późny Dewon'),
	(22, 9, 'Środkowy Dolny'),
	(23, 9, 'Dolny Dewon'),
	(24, 10, 'Przydol'),
	(25, 10, 'Ludlow'),
	(26, 10, 'Wenlok'),
	(27, 10, 'Landower'),
	(28, 11, 'Ordowik Późny'),
	(29, 11, 'Ordowik Środkowy'),
	(30, 11, 'Ordowik Wczesny'),
	(31, 12, 'Furong'),
	(32, 12, 'Miaoling'),
	(33, 12, 'Duklan'),
	(34, 12, 'Terenew');

INSERT INTO GeoPietro (id_pietro, nazwa_pietro, id_epoka) VALUES
	(1, 'Megalaj', 1),
	(2, 'Nortgryp', 1),
	(3, 'Grenland', 1),
	(4, 'Tarant', 2),
	(5, 'Chiban', 2),
	(6, 'Kalabr', 2),
	(7, 'Gelas', 3),
	(8, 'Piacent', 3),
	(9, 'Zankl', 3),
	(10, 'Messyn', 4),
	(11, 'Torton', 4),
	(12, 'Serrawal', 4),
	(13, 'Lang', 4),
	(14, 'Burdyga', 4),
	(15, 'Akwitan', 4),
	(16, 'Szat', 5),
	(17, 'Rupel', 5),
	(18, 'Priabon', 6),
	(19, 'Barton', 6),
	(20, 'Lutet', 6),
	(21, 'Iprez', 6),
	(22, 'Tanet', 7),
	(23, 'Zeland', 7),
	(24, 'Dan', 7),
	(25, 'Mastrycht', 8),
	(26, 'Kampan', 8),
	(27, 'Santon', 8),
	(28, 'Koniak', 8),
	(29, 'Turon', 8),
	(30, 'Cenoman', 8),
	(31, 'Alb', 9),
	(32, 'Apt', 9),
	(33, 'Barrem', 9),
	(34, 'Hoteryw', 9),
	(35, 'Walanzyn', 9),
	(36, 'Berrias', 9),
	(37, 'Tyton', 10),
	(38, 'Kimeryd', 10),
	(39, 'Oksford', 10),
	(40, 'Kelowej', 11),
	(41, 'Baton', 11),
	(42, 'Bajos', 11),
	(43, 'Aalen', 11),
	(44, 'Toark', 12),
	(45, 'Pliensbach', 12),
	(46, 'Synemur', 12),
	(47, 'Hettang', 12),
	(48, 'Retyk', 13),
	(49, 'Noryk', 13),
	(50, 'Karnik', 13),
	(51, 'Ladyn', 14),
	(52, 'Anizyk', 14),
	(53, 'Olenek', 15),
	(54, 'Ind', 15),
	(55, 'Czangsing', 16),
	(56, 'Wucziaping', 16),
	(57, 'Kapitan', 17),
	(58, 'Word', 17),
	(59, 'Road', 17),
	(60, 'Kungur', 18),
	(61, 'Artinsk', 18),
	(62, 'Sakmar', 18),
	(63, 'Assel', 18),
	(64, 'Gzel', 19),
	(65, 'Kasimow', 19),
	(66, 'Moskow', 19),
	(67, 'Baszkir', 19),
	(68, 'Serpuchow', 20),
	(69, 'Wizen', 20),
	(70, 'Turnej', 20),
	(71, 'Famen', 21),
	(72, 'Fran', 21),
	(73, 'Zywet', 22),
	(74, 'Eifel', 22),
	(75, 'Ems', 23),
	(76, 'Prag', 23),
	(77, 'Lochkow', 23),
	(78, 'Przydol', 24),
	(79, 'Ludford', 25),
	(80, 'Gorst', 25),
	(81, 'Homer', 26),
	(82, 'Szejnwud', 26),
	(83, 'Telicz', 27),
	(84, 'Aeron', 27),
	(85, 'Ruddan', 27),
	(86, 'Hirnant', 28),
	(87, 'Kat', 28),
	(88, 'Sandb', 28),
	(89, 'Darriwil', 29),
	(90, 'Daping', 29),
	(91, 'Flo', 30),
	(92, 'Tremadok', 30),
	(93, 'Nelegerian', 31),
	(94, 'Dziangszan', 31),
	(95, 'Paib', 31),
	(96, 'Gużang', 32),
	(97, 'Drum', 32),
	(98, 'Wuliuan', 32),
	(99, 'Piętro 4', 33),
	(100, 'Atdabanian', 33),
	(101, 'Tommotian', 34),
	(102, 'Fortun', 34);

--Tabela stratygraficzna zdenormalizowana
SELECT 
    GeoEon.id_eon,
    GeoEon.nazwa_eon,
    GeoEra.id_era,
    GeoEra.nazwa_era,
    GeoOkres.id_okres,
    GeoOkres.nazwa_okres,
    GeoEpoka.id_epoka,
    GeoEpoka.nazwa_epoka,
    GeoPietro.id_pietro,
    GeoPietro.nazwa_pietro
INTO GeoTabela
FROM GeoPietro
JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon

SELECT * FROM GeoTabela

-- Tabele 10 i 1000000
CREATE TABLE Dziesiec (cyfra INT PRIMARY KEY, bit INT);
INSERT INTO Dziesiec (cyfra, bit) VALUES
	(0, 0), 
	(1, 1), 
	(2, 2),
	(3, 3), 
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9);

CREATE TABLE Milion(liczba INT, cyfra INT, bit INT);
INSERT INTO Milion 
	SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
	FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;

SELECT * FROM Dziesiec
SELECT * FROM Milion