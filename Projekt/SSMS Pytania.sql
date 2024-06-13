USE Geo;

-- 1ZL
DECLARE @i INT = 1;
WHILE @i <= 10
BEGIN
    SET STATISTICS TIME ON;
    PRINT '1ZL';
    SELECT COUNT(*) 
    FROM Milion 
    INNER JOIN GeoTabela ON (Milion.liczba % 102 = GeoTabela.id_pietro);
    SET STATISTICS TIME OFF;
    SET @i = @i + 1;
END

-- 2ZL
SET @i = 1;
WHILE @i <= 10
BEGIN
    SET STATISTICS TIME ON;
    PRINT '2ZL';
    SELECT COUNT(*) FROM Milion 
    INNER JOIN GeoPietro ON(Milion.liczba % 102 = GeoPietro.id_pietro) 
    INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
    INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
    INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
    INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon;
    SET STATISTICS TIME OFF;
    SET @i = @i + 1;
END

-- 3ZG
SET @i = 1;
WHILE @i <= 10
BEGIN
    SET STATISTICS TIME ON;
    PRINT '3ZG';
    SELECT COUNT(*) FROM Milion 
    WHERE (Milion.liczba % 102) = (
        SELECT id_pietro FROM GeoTabela 
        WHERE (Milion.liczba % 102) = id_pietro
    );
    SET STATISTICS TIME OFF;
    SET @i = @i + 1;
END

-- 4ZG
SET @i = 1;
WHILE @i <= 10
BEGIN
    SET STATISTICS TIME ON;
    PRINT '4ZG';
    SELECT COUNT(*) FROM Milion 
    WHERE (Milion.liczba % 102) IN (
        SELECT GeoPietro.id_pietro 
        FROM GeoPietro 
        INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
        INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
        INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
        INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon
    );
    SET STATISTICS TIME OFF;
    SET @i = @i + 1;
END

--Indeksy

CREATE INDEX iEon ON GeoEon(id_eon);
CREATE INDEX iEra ON GeoEra(id_era, id_eon);
CREATE INDEX iOkres ON GeoOkres(id_okres, id_era);
CREATE INDEX iEpoka ON GeoEpoka(id_epoka, id_okres);
CREATE INDEX iPietro ON GeoPietro(id_pietro, id_epoka);
CREATE INDEX iLiczba ON Milion(liczba);
CREATE INDEX iGeoTabela ON GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);
