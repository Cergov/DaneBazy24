-- 1ZL
SELECT COUNT(*) FROM Milion 
	INNER JOIN GeoTabela ON (mod(Milion.liczba,102)=(GeoTabela.id_pietro));

-- 2 ZL
SELECT COUNT(*) FROM Milion 
	INNER JOIN GeoPietro ON (mod(Milion.liczba,102)=GeoPietro.id_pietro) 
	NATURAL JOIN GeoEpoka 
	NATURAL JOIN GeoOkres
	NATURAL JOIN GeoEra 
	NATURAL JOIN GeoEon;

-- 3 ZG
SELECT COUNT(*) FROM Milion 
WHERE (Milion.liczba % 102) = (
	SELECT id_pietro FROM GeoTabela
	WHERE (Milion.liczba % 102) = id_pietro 
);

--4 ZG
SELECT COUNT(*)
FROM Milion
WHERE mod(Milion.liczba,102) IN (SELECT GeoPietro.id_pietro FROM GeoPietro
	NATURAL JOIN GeoEpoka
	NATURAL JOIN GeoOkres
	NATURAL JOIN GeoEra
	NATURAL JOIN GeoEon);


CREATE INDEX iEon ON GeoEon (id_eon);
CREATE INDEX iOkres ON GeoOkres (id_okres,  id_era);
CREATE INDEX iEpoka ON GeoEpoka (id_epoka, id_okres);
CREATE INDEX iPietro ON GeoPietro (id_pietro,id_epoka);
CREATE INDEX iEra ON GeoEra (id_era, id_eon);
CREATE INDEX iMln ON Milion(liczba);
CREATE INDEX iGeoTab ON GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);