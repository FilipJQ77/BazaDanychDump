CREATE DEFINER=`root`@`localhost` FUNCTION `create_series`(

    typ_param ENUM('normal','knockout'),    # typ: normalny(wszystkie serie rownowazne), knockout-pucharowy
    meeting_id_param int,
    discipline_id_param int,
    amount_param int,                        # maksymalna ilość zawodników, z tabeli signup zostaną wybrani najlepsi 
    serie_size_param int, 					# pojemnosc serii -  seria to jedno zdarzenie w czasie: konkretny bieg, lub konkretna grupa skoków
    promotion int							# liczba osob awansujaca do nastepnej rundy (knockout)
) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE signed_up int DEFAULT 0;
    DECLARE athletes_to_remove int DEFAULT 0;
    DECLARE serie_amount int DEFAULT 0;
    DECLARE ret VARCHAR(255) DEFAULT '';
	DECLARE serie_id_p int;

SELECT 
    COUNT(*)
INTO signed_up FROM
    signups
WHERE
    discipline_id = discipline_id_param
        AND meeting_id = meeting_id_param;
    
    IF signed_up > amount_param    THEN        # Jesli zgloszono wiecej zawodnikow niz ilosc miejsc chcemy usunac tych z najgorszymi wynikami
        SET athletes_to_remove = (signed_up - amount_param);
        #  Usuniecie najgorszych
        DELETE FROM signups AS ss WHERE ss.athlete_id IN 
            # Pominiecie id_atlety, wyłuskanie tylko wynikow w kolejnosci od NULL do najpszych
            (SELECT onlyRES.result FROM 
				# Wyszukanie (dla kazdego atlety z bazy) wynikow w dyscyplinie (brak wyniku - null (brak startu, starty ale z DQ, bez ukonczenia ....))
				(SELECT a.athlete_id , IF(discipline_id = discipline_id_param, MIN(t.result), NULL) AS result FROM athletes a
				LEFT JOIN track_results t	ON a.athlete_id = t.athlete_id 
				LEFT JOIN series s 			ON t.series_id = s.series_id
				GROUP BY a.athlete_id
				ORDER BY MIN(t.result) IS NULL ASC, MIN(t.result) LIMIT athletes_to_remove		# pogrupowanie od NULL, do najlepszych
                ) AS onlyRES             
            ) AND ss.discipline_id = disciplin_id_param AND ss.meeting_i = meeting_id_param; 
    END IF;
    
	SELECT 
    COUNT(*)
INTO signed_up FROM
    signups
WHERE
    discipline_id = discipline_id_param
        AND meeting_id = meeting_id_param;
      
	IF typ_param = 'normal' THEN
		SET ret = 'Created series id\'s (all final type): ';
        SET serie_amount = Ceil(signed_up/serie_size_param);

		label: WHILE serie_amount > 0 DO
			SET serie_amount = serie_amount - 1;
			INSERT INTO series (discipline_id, meeting_id,s_type) 
			SELECT discipline_id_param, meeting_id_param, 'final' from DUAL;
			SELECT MAX(series_id) INTO serie_id_p  from series;
			SET ret = CONCAT(ret, CONVERT(serie_id_p,char),' ');
        END WHILE label;
	END IF;
    
    IF typ_param = 'knockout' THEN
		SET ret = 'Created series id\'s: ';
        
    END IF;
    RETURN ret;
END