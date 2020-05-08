CREATE OR REPLACE VIEW `athlete_track_results` AS
    SELECT 
        a.first_name AS "Imie",
        a.last_name AS "Nazwisko",
        c.c_name AS "Klub",
        d.discipline AS "Dyscyplina",
        t.result AS "Wynik",
        m.m_date AS "Data",
        ar.arena_id AS "Stadion",
        ar.city AS "Stadion_miasto",
		ar.country AS "Stadion_kraj",
        r.rank_description AS "Ranga",
        m.m_description AS "Event",
        s.s_type AS "Seria"
    FROM
        track_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
		JOIN disciplines d ON d.discipline_id = s.discipline_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
        JOIN arenas ar ON ar.arena_id = m.arena_id
        JOIN ranks r ON m.rank_id = r.rank_id;
		
CREATE OR REPLACE VIEW `athlete_jump_results` AS
    SELECT 
        a.first_name AS "Imie",
        a.last_name AS "Nazwisko",
        c.c_name AS "Klub",
        d.discipline AS "Dyscyplina",
        j.result AS "Wynik",
        m.m_date AS "Data",
        ar.arena_id AS "Stadion",
        ar.city AS "Stadion_miasto",
		ar.country AS "Stadion_kraj",
        r.rank_description AS "Ranga",
        m.m_description AS "Event",
        s.s_type AS "Seria"
    FROM
        jump_results j
        JOIN athletes a ON a.athlete_id = j.athlete_id
        JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = j.series_id
		JOIN disciplines d ON d.discipline_id = s.discipline_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
        JOIN arenas ar ON ar.arena_id = m.arena_id
        JOIN ranks r ON m.rank_id = r.rank_id;
		
CREATE OR REPLACE VIEW `track_records` AS
	SELECT
		Dyscyplina,
		MIN(Wynik),
		Imie,
		Nazwisko,
		Klub,
		Data,
		Stadion,
		Stadion_miasto,
		Stadion_kraj,
		Ranga,
		Event,
		Seria
	FROM 
		athlete_track_results
	GROUP BY
		Dyscyplina;
		
CREATE OR REPLACE VIEW `jump_records` AS
	SELECT
		Dyscyplina,
		MAX(Wynik),
		Imie,
		Nazwisko,
		Klub,
		Data,
		Stadion,
		Stadion_miasto,
		Stadion_kraj,
		Ranga,
		Event,
		Seria
	FROM 
		athlete_jump_results
	GROUP BY
		Dyscyplina;