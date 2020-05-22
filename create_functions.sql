DELIMITER //
CREATE PROCEDURE lekkoatletyka.create_limit_track (IN meeting_id_p INT, discipline_id_p INT)
BEGIN

    DECLARE meeting_date date;
    DECLARE event_rank VARCHAR(13);
    DECLARE average_result TIME(3);
    
	SELECT m_date
    INTO meeting_date
	FROM meetings m
	WHERE m.meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings m
    WHERE m.meeting_id=meeting_id_p;
    
    SELECT 
        AVG(t.result)
	INTO
		average_result
    FROM
        track_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p;
    
    INSERT INTO limits (meeting_id, discipline_id, track_res)
    VALUES (meeting_id_p, discipline_id_p, average_result)
    ON DUPLICATE KEY UPDATE track_res=average_result;
    
END;

DELIMITER //
CREATE PROCEDURE lekkoatletyka.create_limit_jump (IN meeting_id_p INT, discipline_id_p INT)
BEGIN

    DECLARE meeting_date date;
    DECLARE event_rank VARCHAR(13);
    DECLARE average_result DECIMAL(5,3);
    
	SELECT m_date
    INTO meeting_date
	FROM meetings m
	WHERE m.meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings m
    WHERE m.meeting_id=meeting_id_p;
    
    SELECT 
        AVG(j.result)
	INTO
		average_result
    FROM
        jump_results j
        JOIN athletes a ON a.athlete_id = j.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = j.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p;
    
    INSERT INTO limits (meeting_id, discipline_id, jump_res)
    VALUES (meeting_id_p, discipline_id_p, average_result)
    ON DUPLICATE KEY UPDATE jump_res=average_result;
    
END;

DELIMITER //
CREATE PROCEDURE lekkoatletyka.signup_track (IN athlete_id_p INT, meeting_id_p INT, discipline_id_p INT)
BEGIN

    DECLARE meeting_limit TIME(3);
    DECLARE meeting_date date;
    DECLARE athlete_best_result TIME(3);
    DECLARE event_rank VARCHAR(13);
    
	SELECT track_res
    INTO meeting_limit
	FROM limits
	WHERE meeting_id=meeting_id_p
    AND discipline_id=discipline_id_p;
    
    SELECT m_date
    INTO meeting_date
	FROM meetings
	WHERE meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings
    WHERE meeting_id=meeting_id_p;
    
    SELECT 
        MIN(t.result)
	INTO
		athlete_best_result
    FROM
        track_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p
        AND a.athlete_id = athlete_id_p;
    
    IF meeting_limit IS NOT NULL THEN
		IF athlete_best_result<meeting_limit THEN
			INSERT INTO signups
            VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
		END IF;
	END IF;
    IF meeting_limit IS NULL THEN
 		INSERT INTO signups
 		VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
     END IF;
END;

DELIMITER //
CREATE PROCEDURE lekkoatletyka.signup_jump (IN athlete_id_p INT, meeting_id_p INT, discipline_id_p INT)
BEGIN

	DECLARE meeting_limit DECIMAL(5,3);
    DECLARE meeting_date date;
    DECLARE athlete_best_result DECIMAL(5,3);
    DECLARE event_rank VARCHAR(13);
    
	SELECT jump_res
    INTO meeting_limit
	FROM limits
	WHERE meeting_id=meeting_id_p
    AND discipline_id=discipline_id_p;
    
    SELECT m_date
    INTO meeting_date
	FROM meetings
	WHERE meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings
    WHERE meeting_id=meeting_id_p;
    
    SELECT 
        MAX(j.result)
	INTO
		athlete_best_result
    FROM
        jump_results j
        JOIN athletes a ON a.athlete_id = j.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = j.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p
        AND a.athlete_id = athlete_id_p;
    
    IF meeting_limit IS NOT NULL THEN
		IF athlete_best_result>meeting_limit THEN
			INSERT INTO signups
            VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
		END IF;
	END IF;
    IF meeting_limit IS NULL THEN
 		INSERT INTO signups
 		VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
     END IF;
END;

DELIMITER //
CREATE PROCEDURE lekkoatletyka.athlete_dsq (IN athlete_id_p INT, meeting_id_p INT)
BEGIN
	UPDATE track_results
        SET result = NULL
        WHERE athlete_id=athlete_id_p AND series_id IN	(SELECT series_id
															FROM series
															WHERE meeting_id = meeting_id_p);
	UPDATE jump_results
        SET result = NULL
        WHERE athlete_id=athlete_id_p AND series_id IN	(SELECT series_id
															FROM series
															WHERE meeting_id = meeting_id_p);
END;