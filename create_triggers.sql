DELIMITER //
CREATE TRIGGER track_dsq AFTER UPDATE ON track_results
FOR EACH ROW
BEGIN
    DECLARE meeting_id_dsq INT;
    SELECT meeting_id
    INTO meeting_id_dsq
    FROM track_results t
    JOIN series ON (t.series_id=s.series_id)
    WHERE t.series_id=NEW.series_id;
    
    IF NEW.result IS NULL THEN
		CREATE TEMPORARY TABLE series_to_dsq
		SELECT series_id
		FROM series
		WHERE meeting_id = meeting_id_dsq;
	
		UPDATE track_results
        SET result = NULL
        WHERE athlete_id=NEW.athlete_id AND meeting_id=meeting_id_dsq;

		DROP TEMPORARY TABLE series_to_dsq;
	END IF;
END;

DELIMITER //
CREATE TRIGGER jump_dsq AFTER UPDATE ON jump_results
FOR EACH ROW
BEGIN
    DECLARE meeting_id_dsq INT;
    SELECT meeting_id
    INTO meeting_id_dsq
    FROM jump_results j
    JOIN series ON (j.series_id=s.series_id)
    WHERE j.series_id=NEW.series_id;
    
    IF NEW.result IS NULL THEN
		CREATE TEMPORARY TABLE series_to_dsq
		SELECT series_id
		FROM series
		WHERE meeting_id = meeting_id_dsq;
	
		UPDATE jump_results
        SET result = NULL
        WHERE athlete_id=NEW.athlete_id AND meeting_id=meeting_id_dsq;

		DROP TEMPORARY TABLE series_to_dsq;
	END IF;
END;