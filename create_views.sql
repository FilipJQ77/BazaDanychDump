CREATE OR REPLACE VIEW `athlete_track_results` AS
    SELECT 
        a.first_name AS "Imie",
        a.last_name AS "Nazwisko",
        a.birth AS "Rocznik",
        c.c_name AS "Klub",
        d.discipline AS "Dyscyplina",
		IF(d.sex = 'male','M','K') AS "Plec",
        t.result AS "Wynik",
		s.s_type AS "Seria",
		m.m_description AS "Event",
        m.m_date AS "Data",
        ar.arena_id AS "Stadion",
        ar.city AS "Stadion_miasto",
		ar.country AS "Stadion_kraj",
        r.rank_id AS "Ranga"
    FROM
        track_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
		JOIN disciplines d ON d.discipline_id = s.discipline_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
        JOIN arenas ar ON ar.arena_id = m.arena_id
        JOIN ranks r ON m.rank_id = r.rank_id;
		
CREATE OR REPLACE VIEW `athlete_jump_results` AS
      SELECT 
        a.first_name AS "Imie",
        a.last_name AS "Nazwisko",
        a.birth AS "Rocznik",
        c.c_name AS "Klub",
        d.discipline AS "Dyscyplina",
		IF(d.sex = 'male','M','K') AS "Plec",
        t.result AS "Wynik",
		s.s_type AS "Seria",
		m.m_description AS "Event",
        m.m_date AS "Data",
        ar.arena_id AS "Stadion",
        ar.city AS "Stadion_miasto",
		ar.country AS "Stadion_kraj",
        r.rank_id AS "Ranga"
    FROM
        jump_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
		JOIN disciplines d ON d.discipline_id = s.discipline_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
        JOIN arenas ar ON ar.arena_id = m.arena_id
        JOIN ranks r ON m.rank_id = r.rank_id;
		
		
CREATE OR REPLACE VIEW `track_records` AS
	SELECT
		Dyscyplina,
        Plec,
		MIN(Wynik) AS "Rekord",
		Imie,
		Nazwisko,
		Klub,
		Seria,
        Event,
		Data,
		Stadion,
		Stadion_miasto,
		Stadion_kraj,
		Ranga
	FROM 
		athlete_track_results
	GROUP BY
		Dyscyplina, Plec;
		
CREATE OR REPLACE VIEW `jump_records` AS
		SELECT
		Dyscyplina,
        Plec,
		MAX(Wynik) AS "Rekord",
		Imie,
		Nazwisko,
		Klub,
		Seria,
        Event,
		Data,
		Stadion,
		Stadion_miasto,
		Stadion_kraj,
		Ranga
	FROM 
		athlete_jump_results
	GROUP BY
		Dyscyplina, Plec;