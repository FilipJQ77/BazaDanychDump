CREATE TABLE clubs (
  id      	INT NOT NULL AUTO_INCREMENT, 
  c_name    VARCHAR(255) NOT NULL, 
  country 	VARCHAR(255) NOT NULL, 
  city  	VARCHAR(255) NOT NULL, 
  PRIMARY KEY (id)
  );
  
  CREATE TABLE athletes (
  id          INT NOT NULL AUTO_INCREMENT, 
  club_id     INT NOT NULL, 
  first_name  VARCHAR(255) NOT NULL, 
  last_name   VARCHAR(255) NOT NULL, 
  birth       DATE NOT NULL, 
  nationality VARCHAR(255) NOT NULL, 
  sex         ENUM('male','female') NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (club_id) REFERENCES clubs(id)
);

CREATE TABLE disciplines (
  id          varchar(255) NOT NULL, 
  sex         ENUM('male','female') NOT NULL,
  d_description varchar(1024) NOT NULL, 
  PRIMARY KEY (id));
  
  CREATE TABLE ranks (
  rank_value 		ENUM('international','continental','national','usual') NOT NULL,
  rank_description  varchar(255) NOT NULL, 
  PRIMARY KEY (rank_value),
  CHECK (rank_value IN (1,2,3,4))
  );
  
  
CREATE TABLE arenas (
  id         int NOT NULL AUTO_INCREMENT, 
  rank_value ENUM('international','continental','national','usual') NOT NULL,
  country    char(255) NOT NULL, 
  city       char(255) NOT NULL, 
  PRIMARY KEY (id),
  FOREIGN KEY (rank_value) REFERENCES ranks(rank_value)
  );
  
  
CREATE TABLE meetings (
  id          int NOT NULL AUTO_INCREMENT, 
  rank_value  ENUM('international','continental','national','usual') NOT NULL,
  arena_id    int  NOT NULL, 
  m_date      date NOT NULL, 
  m_description varchar(255), 
  PRIMARY KEY (id),
  FOREIGN KEY (rank_value) REFERENCES ranks(rank_value),
  FOREIGN KEY (arena_id) REFERENCES arenas(id)
  );
  
  CREATE TABLE series (
  id          	  int NOT NULL AUTO_INCREMENT, 
  discipline_id   varchar(255) NOT NULL, 
  meeting_id      int NOT NULL, 
  s_type		  enum('final','semi-final','quarter-final','1/8','1/16','elimination') NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(id)
  );
  
  CREATE TABLE jump_results (
  id int NOT NULL AUTO_INCREMENT,
  athlete_id int NOT NULL,
  series_id int NOT NULL,
  result decimal(5,3),
  PRIMARY KEY(id),
  FOREIGN KEY (athlete_id) REFERENCES athletes(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
  );
  
  CREATE TABLE track_results (
  id int NOT NULL AUTO_INCREMENT,
  athlete_id int NOT NULL,
  series_id int NOT NULL,
  result time(3),
  PRIMARY KEY(id),
  FOREIGN KEY (athlete_id) REFERENCES athletes(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
  );
  
  CREATE TABLE signups (
  athlete_id int NOT NULL,
  meeting_id int NOT NULL,
  discipline_id varchar(255) NOT NULL,
  PRIMARY KEY(athlete_id, meeting_id, discipline_id),
  FOREIGN KEY (athlete_id) REFERENCES athletes(id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(id)
  );
  
  CREATE TABLE limits (
  meeting_id int NOT NULL,
  discipline_id varchar(255) NOT NULL,
  track_res time(3),
  jump_res decimal(5,3),
  PRIMARY KEY(meeting_id, discipline_id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(id)
  );
  