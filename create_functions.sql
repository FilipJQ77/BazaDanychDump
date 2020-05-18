DELIMITER //

-- DROP PROCEDURE lekkoatletyka.create_limit_track

CREATE PROCEDURE lekkoatletyka.create_limit_track (IN meeting_id INT, discipline_id INT)
BEGIN

    DECLARE meeting_date date;
    
	SELECT m_date
    INTO meeting_date
	FROM m.meetings
	WHERE m.meeting_id=meeting_id;
    
	UPDATE limits l
    SET track_res = (SELECT AVG(result)
					FROM athlete_track_results a
                    WHERE a.meeting_date > DATEADD(year, -1, meeting_date))
    WHERE (l.meeting_id=meeting_id AND l.discipline_id = discipline_id);
    
END;