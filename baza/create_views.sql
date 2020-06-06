CREATE OR REPLACE VIEW `athlete_track_results` AS
    SELECT 
        a.athlete_id AS "athlete_id",
        a.first_name AS "first_name",
        a.last_name AS "last_name",
        a.birth AS "birth_date",
        a.nationality AS "nationality",
        c.c_name AS "club",
        d.discipline AS "discipline",
        IF(d.sex = 'male','M','F') AS "sex",
        t.result AS "result",
        m.m_date AS "meeting_date",
        ar.arena_id AS "stadium",
        ar.city AS "stadium_city",
		ar.country AS "stadium_country",
        r.rank_id AS "meeting_rank",
        m.m_description AS "meeting",
        s.s_type AS "series"
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
		a.athlete_id AS "athlete_id",
        a.first_name AS "first_name",
        a.last_name AS "last_name",
        a.birth AS "birth_date",
        a.nationality AS "nationality",
        c.c_name AS "club",
        d.discipline AS "discipline",
        IF(d.sex = 'male','M','F') AS "sex",
        j.result AS "result",
        m.m_date AS "meeting_date",
        ar.arena_id AS "stadium",
        ar.city AS "stadium_city",
		ar.country AS "stadium_country",
        r.rank_id AS "meeting_rank",
        m.m_description AS "meeting",
        s.s_type AS "series"
    FROM
        jump_results j
        JOIN athletes a ON a.athlete_id = j.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = j.series_id
		JOIN disciplines d ON d.discipline_id = s.discipline_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
        JOIN arenas ar ON ar.arena_id = m.arena_id
        JOIN ranks r ON m.rank_id = r.rank_id;
		
CREATE OR REPLACE VIEW `track_records` AS
	SELECT
		discipline,
        sex,
		MIN(result) AS "Record",
		first_name,
		last_name,
        nationality,
		club,
		meeting_date,
		stadium,
		stadium_city,
		stadium_country,
		meeting_rank,
		meeting,
		series
	FROM 
		athlete_track_results
	GROUP BY
		discipline, sex;
		
CREATE OR REPLACE VIEW `jump_records` AS
	SELECT
		discipline,
        sex,
		MAX(result) AS "Record",
		first_name,
		last_name,
        nationality,
		club,
		meeting_date,
		stadium,
		stadium_city,
		stadium_country,
		meeting_rank,
		meeting,
		series
	FROM 
		athlete_jump_results
	GROUP BY
		discipline, sex;