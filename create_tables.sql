CREATE TABLE clubs (
  club_id      	int NOT NULL AUTO_INCREMENT, 
  c_name    varchar(255) NOT NULL, 
  country 	varchar(255) NOT NULL, 
  city  	varchar(255) NOT NULL, 
  PRIMARY KEY (club_id)
  );
  
  CREATE TABLE athletes (
  athlete_id          int NOT NULL AUTO_INCREMENT, 
  club_id     int NOT NULL, 
  first_name  varchar(255) NOT NULL, 
  last_name   varchar(255) NOT NULL, 
  birth       date NOT NULL, 
  nationality varchar(255) NOT NULL, 
  sex         enum('male','female') NOT NULL,
  PRIMARY KEY (athlete_id),
  FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE disciplines (
  discipline_id    int NOT NULL AUTO_INCREMENT, 
  discipline varchar(255) NOT NULL,
  sex         enum('male','female') NOT NULL,
  d_description varchar(1024) NOT NULL, 
  PRIMARY KEY (discipline_id));
  
  CREATE TABLE ranks (
  rank_id			enum('international','continental','national','usual') NOT NULL,
  rank_description  varchar(255) NOT NULL, 
  PRIMARY KEY (rank_id),
  CHECK (rank_id IN (1,2,3,4))
  );
  
  
CREATE TABLE arenas (
  arena_id     varchar(255) NOT NULL, 
  rank_id 		enum('international','continental','national','usual') NOT NULL,
  country    char(255) NOT NULL, 
  city       char(255) NOT NULL, 
  PRIMARY KEY (arena_id),
  FOREIGN KEY (rank_id) REFERENCES ranks(rank_id)
  );
  
  
CREATE TABLE meetings (
  meeting_id          int NOT NULL AUTO_INCREMENT, 
  rank_id  enum('international','continental','national','usual') NOT NULL,
  arena_id    varchar(255)  NOT NULL, 
  m_date      date NOT NULL, 
  m_description varchar(255), 
  PRIMARY KEY (meeting_id),
  FOREIGN KEY (rank_id) REFERENCES ranks(rank_id),
  FOREIGN KEY (arena_id) REFERENCES arenas(arena_id)
  );
  
  CREATE TABLE series (
  series_id       int NOT NULL AUTO_INCREMENT, 
  discipline_id   int NOT NULL, 
  meeting_id      int NOT NULL, 
  s_type		  enum('final','semi-final','quarter-final','1/8','1/16','elimination') NOT NULL,
  PRIMARY KEY (series_id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(discipline_id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(meeting_id)
  );
  
  CREATE TABLE jump_results (
  jump_result_id 	int NOT NULL AUTO_INCREMENT,
  athlete_id 	int NOT NULL,
  series_id 	int NOT NULL,
  result 		decimal(5,3),
  PRIMARY KEY(jump_result_id),
  FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id),
  FOREIGN KEY (series_id) REFERENCES series(series_id)
  );
  
  CREATE TABLE track_results (
  track_result_id 	int NOT NULL AUTO_INCREMENT,
  athlete_id 	int NOT NULL,
  series_id		int NOT NULL,
  result 		time(3),
  PRIMARY KEY(track_result_id),
  FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id),
  FOREIGN KEY (series_id) REFERENCES series(series_id)
  );
  
  CREATE TABLE signups (
  athlete_id		int NOT NULL,
  meeting_id		int NOT NULL,
  discipline_id	 	int NOT NULL,
  PRIMARY KEY(athlete_id, meeting_id, discipline_id),
  FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(meeting_id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(discipline_id)
  );
  
  CREATE TABLE limits (
  meeting_id 		int NOT NULL,
  discipline_id 	int NOT NULL,
  track_res 		time(3),
  jump_res 			decimal(5,3),
  PRIMARY KEY(meeting_id, discipline_id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(meeting_id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(discipline_id)
  );

