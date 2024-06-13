CREATE DATABASE firmax;
GO
USE firmax;
GO
CREATE SCHEMA ksiegowosc;
GO

--tabela pracownikow
CREATE TABLE ksiegowosc.pracownicy (
id_pracownika INTEGER NOT NULL PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100) NOT NULL,
telefon INTEGER);

--tabela godzin
CREATE TABLE ksiegowosc.godziny (
id_godziny INTEGER NOT NULL PRIMARY KEY,
dataa DATE NOT NULL,
liczba_godzin INTEGER NOT NULL,
id_pracownika INTEGER NOT NULL,
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy (id_pracownika)
ON DELETE CASCADE
ON UPDATE CASCADE
);

--tabela pensji
CREATE TABLE ksiegowosc.pensja (
id_pensji INTEGER NOT NULL PRIMARY KEY,
stanowisko VARCHAR(50) NOT NULL,
kwota INTEGER NOT NULL,)

--tabela premii
CREATE TABLE ksiegowosc.premia (
id_premii INTEGER NOT NULL PRIMARY KEY,
rodzaj VARCHAR(100),
kwota INTEGER NOT NULL);

--tabela laczaca, wynagrodzenie
CREATE TABLE ksiegowosc.wynagrodzenie (
id_wynagrodzenia INTEGER NOT NULL PRIMARY KEY,
dataa DATE NOT NULL,
id_pracownika INTEGER NOT NULL,
id_godziny INTEGER NOT NULL,
id_pensji INTEGER NOT NULL,
id_premii INTEGER NOT NULL,
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy (id_pracownika)
ON DELETE NO ACTION,
FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny (id_godziny)
ON DELETE NO ACTION,
FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensja (id_pensji)
ON DELETE NO ACTION,
FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.premia (id_premii)
ON DELETE NO ACTION)

INSERT INTO ksiegowosc.pracownicy VALUES 
(1, 'Andrzej', 'Dudek', 'Kraków', 695229000),
(2, 'Grzegorz', 'Grzegżółka', 'Szczebrzeszyn', 567392743),
(3, 'Karol', 'Wojdyła', 'Wadowice', 694202137),
(4, 'Anita', 'Lis', 'Krosno', 769469133),
(5, 'Róża', 'Luksemburg', 'Katowice', 673291917),
(6, 'Krystian', 'Kasprzycki', 'Dukla', 688473958),
(7, 'Zbigniew', 'Włodecki', 'Dukla', 574894092),
(8, 'Krzysztof', 'Suchodolski', 'Choroszcz', 690483456),
(9, 'Anastazja', 'Szewczenko', 'Biełgorod', 567392043),
(10, 'Katarzyna', 'Nachman', 'Rymanów', 673829302);

INSERT INTO ksiegowosc.godziny VALUES 
(1, '2024-04-01', 6, 1),
(2, '2024-04-01', 8, 2),
(3, '2024-04-01', 8, 3),
(4, '2024-04-01', 8, 4),
(5, '2024-04-01', 10, 5),
(6, '2024-04-02', 6, 6),
(7, '2024-04-02', 9, 7),
(8, '2024-04-02', 8, 8),
(9, '2024-04-02', 12, 9),
(10, '2024-04-02', 7, 10);

INSERT INTO ksiegowosc.pensja VALUES 
(1, 'Kierownik działu', 7500.00, 1),
(2, 'Koordynator', 6800.00, 2),
(3, 'Specjalista IT', 6500.00, 3),
(4, 'Księgowy', 3500.00, 4),
(5, 'Recepcja', 2500.00, 5),
(6, 'Sprzątacz', 2500.00, 6),
(7, 'Grafik', 4800.00, 7),
(8, 'PR', 3100.00, 8),
(9, 'Analityk', 4600.00, 9),
(10, 'Pracownik', 4000.00, 10);

INSERT INTO ksiegowosc.premia VALUES 
(1, 'Premia motywacyjna', 1500.00),
(2, 'Premia uznaniowa', 2000.00),
(3, 'Premia stażowa', 1000.00),
(4, 'Premia świąteczna', 960.00),
(5, 'Premia za nadgodziny', 2500.00),
(6, 'Premia za wyniki', 2000.00),
(7, 'Premia za punktualność', 800.00),
(8, 'Premia kierownicza', 2800.00),
(9, 'Premia specjalna', 2000.00),
(10, 'Premia za działalność marketingową', 250.00);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(1, '2024-03-25',1,1,1,1),
(2, '2024-03-25',2,2,2,2),
(3, '2024-03-25',3,3,3,3),
(4, '2024-03-25',4,4,4,4),
(5, '2024-03-25',5,5,5,5),
(6, '2024-03-25',6,6,6,6),
(7, '2024-03-25',7,7,7,7),
(8, '2024-03-25',8,8,8,8),
(9, '2024-03-25',9,9,9,9),
(10, '2024-03-25',10,10,10,10);

--a
SELECT id_pracownika,nazwisko FROM ksiegowosc.pracownicy
--b
SELECT p.id_pracownika 
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
JOIN ksiegowosc.pensja pn ON w.id_pensji = pn.id_pensji
WHERE pn.kwota > 1000;
--c
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON w.id_pensji=pn.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii=pr.id_premii
WHERE pr.id_premii IS NULL AND pn.kwota > 2000;
--d
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';
--e
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';
--f
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika=g.id_godziny
WHERE g.liczba_godzin*20 > 160; --bo 20 dni w miesiacu
--g
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
WHERE pn.kwota BETWEEN 1500 AND 3000
--h
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.godziny g ON g.id_godziny = w.id_godziny
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
WHERE g.liczba_godzin > 8 AND pr.id_premii IS NULL
--i
SELECT p.imie, p.nazwisko, pn.kwota
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
ORDER BY pn.kwota
--j
SELECT p.imie, p.nazwisko, pn.kwota AS kwPensji, pr.kwota AS kwPremii 
--nowe nazwy kolumn co by nie było 2x "kwota"
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
ORDER BY pn.kwota DESC, pr.kwota DESC