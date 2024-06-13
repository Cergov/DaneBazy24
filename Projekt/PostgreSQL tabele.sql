CREATE DATABASE Geo;

-- Tworzenie tabel stratygraficznych
CREATE TABLE GeoEon (
    id_eon INT PRIMARY KEY,
    nazwa_eon VARCHAR(255)
);

CREATE TABLE GeoEra (
    id_era INT PRIMARY KEY,
    id_eon INT,
    nazwa_era VARCHAR(255),
    FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon)
);

CREATE TABLE GeoOkres (
    id_okres INT PRIMARY KEY,
    id_era INT,
    nazwa_okres VARCHAR(255),
    FOREIGN KEY (id_era) REFERENCES GeoEra(id_era)
);

CREATE TABLE GeoEpoka (
    id_epoka INT PRIMARY KEY,
    id_okres INT,
    nazwa_epoka VARCHAR(255),
    FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres)
);

CREATE TABLE GeoPietro (
    id_pietro INT PRIMARY KEY,
    id_epoka INT,
    nazwa_pietro VARCHAR(255),
    FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka)
);

-- Wsadzenie danych
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
   
