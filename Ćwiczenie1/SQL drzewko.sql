-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-11 01:06:47.263

-- tables
-- Table: Artykuły
CREATE TABLE Artykuły (
    ID Zamówienia int  NOT NULL,
    ID Pudelka int  NOT NULL,
    Sztuk int  NOT NULL,
    CONSTRAINT Artykuły_pk PRIMARY KEY (ID Zamówienia)
);

-- Table: Czekoladki
CREATE TABLE Czekoladki (
    ID Czekoladki int  NOT NULL,
    Nazwa text  NOT NULL,
    Rodzaj Czekolady text  NOT NULL,
    Rodzaj Orzechów text  NOT NULL,
    Rodzaj Nadzienia text  NOT NULL,
    Opis text  NOT NULL,
    Koszt money  NOT NULL,
    Masa int  NOT NULL,
    CONSTRAINT Czekoladki_pk PRIMARY KEY (ID Czekoladki)
);

-- Table: Klienci
CREATE TABLE Klienci (
    ID Klienta int  NOT NULL,
    Imie text  NOT NULL,
    Ulica text  NOT NULL,
    Miejscowosc text  NOT NULL,
    Kod text  NOT NULL,
    Telefon int  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (ID Klienta)
);

-- Table: Pudelka
CREATE TABLE Pudelka (
    ID Pudelka int  NOT NULL,
    Nazwa Zestawu text  NOT NULL,
    Opis Zestawu text  NOT NULL,
    Cena money  NOT NULL,
    Stan int  NOT NULL,
    CONSTRAINT Pudelka_pk PRIMARY KEY (ID Pudelka)
);

-- Table: Zamówienia
CREATE TABLE Zamówienia (
    ID Zamówienia int  NOT NULL,
    ID Klientia int  NOT NULL,
    Data realizacji date  NOT NULL,
    CONSTRAINT Zamówienia_pk PRIMARY KEY (ID Zamówienia)
);

-- Table: Zawartosc
CREATE TABLE Zawartosc (
    ID Pudelka int  NOT NULL,
    ID Czekoladki int  NOT NULL,
    Sztuk int  NOT NULL,
    CONSTRAINT Zawartosc_pk PRIMARY KEY (ID Pudelka)
);

-- foreign keys
-- Reference: Artykuły_Pudekła (table: Artykuły)
ALTER TABLE Artykuły ADD CONSTRAINT Artykuły_Pudekła FOREIGN KEY Artykuły_Pudekła ()
    REFERENCES Pudelka ();

-- Reference: Artykuły_Zamówienia (table: Artykuły)
ALTER TABLE Artykuły ADD CONSTRAINT Artykuły_Zamówienia FOREIGN KEY Artykuły_Zamówienia ()
    REFERENCES Zamówienia ();

-- Reference: ID Zamówień (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT ID Zamówień FOREIGN KEY ID Zamówień ()
    REFERENCES Artykuły ();

-- Reference: Pudelka_Zawartosc (table: Pudelka)
ALTER TABLE Pudelka ADD CONSTRAINT Pudelka_Zawartosc FOREIGN KEY Pudelka_Zawartosc ()
    REFERENCES Zawartosc ();

-- Reference: Zamówienia_Klienci (table: Zamówienia)
ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Klienci FOREIGN KEY Zamówienia_Klienci ()
    REFERENCES Klienci ();

-- Reference: Zawartość_Czekoladki (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartość_Czekoladki FOREIGN KEY Zawartość_Czekoladki ()
    REFERENCES Czekoladki ();

-- End of file.

