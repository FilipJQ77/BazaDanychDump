# SKRYPT DODAJĄCY MEETING

# Dodanie stadionu w chorzowie
INSERT INTO arenas VALUES ('StadionŚląski','international','Poland','Chorzów');

# Doddaie meetingu
INSERT INTO meetings (rank_id,arena_id,m_date,m_description)
VALUES ('usual','StadionŚląski','2019-09-14','10. Lotto Memoriał Kamili Skolimowskiej');

# Zniesienie ograniczenia NOT NULL dla kolumny club_id - zawodnik może nie posiadać klubu
AlTER TABLE athletes
MODIFY club_id int;

# Dodanie dyscypliny: biega na 1000m

INSERT INTO disciplines (discipline, sex, d_description)
VALUES ('1000m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. Na otwartym stadionie 1000m odpowiada dwa i pół okrążenia.'),
	   ('1000m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. Na otwartym stadionie 1000m odpowiada dwa i pół okrążenia.');

																			
INSERT INTO clubs (c_name, country, city) VALUES
('OSOT Szczecin','Poland','Szczecin'),
('CWZS Zawisza Bydgoszcz SL','Poland','Bydgoszcz'),
('KS AZS AWF Wrocław','Poland','Wrocław'),
('WKS Śląsk Wrocław','Poland','Wrocław'),
('AZS UMCS Lublin','Poland','Lublin'),
('RKS Łódź','Poland','Łódź'),
('OŚ AZS Poznań','Poland','Poznań '),
('KS AZS UWM Olsztyn','Poland','Olsztyn'),
('MUKS Park Zduńska Wola','Poland','Zduńska Wola'),
('MKS Iskra Pszczyna','Poland','Pszczyna'),
('AZS-AWFiS Gdańsk','Poland','Gdańsk'),
('RLTL ZTE Radom','Poland','Radom'),
('KS Gwardia Piła','Poland','Piła'),
('KS AZS AWF Kraków','Poland','Kraków'),
('AZS-AWF Katowice','Poland','Katowice'),
('SKLA Sopot','Poland','Sopot'),
('UKS Sprint 2020 Warszawa','Poland','Warszawa'),
('KL Bałtyk Koszalin','Poland','Koszalin'),
('UKS Barnim Goleniów','Poland','Goleniów'),
('KS Podlasie Białystok','Poland','Białystok');


# Początkowe dodanie Dodanie zawodników (Tyczka)
INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(1,'Piotr','Lisek','1992-08-16','Poland','male'),
(2,'Paweł','Wojciechowski','1989-06-06','Poland','male'),
(null,'Bo Kanda Lita','Baehre','1999-04-29','Poland','male'),
(null,'Scott','Houston','1990-06-11','USA','male'),
(null,'Mareks','Arents','1986-08-06','Latvia,','male'),
(null,'Torben','Blech','1995-02-12','Germany','male'),
(3,'Robert','Sobera','1991-01-19','Poland','male'),
(null,'Emmanouil','Karalis','1999-10-20','Greece','male'),
(2,'Karol','Pawlik','1994-03-17','Poland','male');
	

# Zgłoszenie zawodników (tyczka)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id, 1, 21 			# id meetingu = 1 id tyczki mezczyzn = 21
FROM athletes 
WHERE athlete_id >= 1 AND athlete_id <=9;



# Utworzenie serii (Dla skoków baza nie przechowuje informacji o ilości wykonanych, spalonych oraz kolejnych wysokosciach,
# baza przechowuje jedynie ostateczny wynik uzyskany przez zawodnika)
# Tworzymy 1 serię

INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (21,1,'final');


# Umieszczenie wyników
INSERT INTO jump_results (athlete_id, series_id, result) 
VALUES (1,1,5.82),(2,1,5.72),(3,1,5.62),(4,1,5.52),(5,1,5.42),(6,1,5.42),(7,1,5.22),(8,1,NULL),(9,1,NULL);


# Dodanie zawodników (wzywyż kobiet)
INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(NULL,'Mariya','Lasitskene','1993-01-14','Russia','female'),
(NULL,'Anna','Simic','1990-05-05','Croatia','female'),
(NULL,'Nicola','McDermott','1996-12-28','Austrialia','female'),
(16,'Paulina','Borys','1998-05-14','Poland','female'),
(NULL,'Inika','McPherson','1986-09-29','USA','female'),
(2,'Adrianna','Sułek','1999-04-03','Poland','female');



# Zgłoszenie zawodników (wzyz kobiet)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id, 1, 18 			# id meetingu = 1 id wzywz kobiet = 18
FROM athletes 
WHERE athlete_id >= 10 ;

#Utworzenie serii
INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (18,1,'final');

# Umieszczenie wyników
INSERT INTO jump_results (athlete_id, series_id, result) 
VALUES (10,2,1.94),(11,2,1.90),(12,2,1.90),(13,2,1.80),(14,2,1.80),(15,2,NULL);


# Początkowe dodanie Dodanie zawodników (100m mezczyzn)

INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(NULL,'Isiah','Young','1990-06-05','USA','male'),
(NULL,'Seye','Ogunlewe','1991-08-30','Nigeria','male'),
(Null,'Brandon','Carnes','1995-03-06','USA','male'),
(Null,'Tommy','Ramdhan','1996-11-28','GB','male'),
(Null,'Sean','Safo-Antwi','1990-01-01','Ghana','male'),
(Null,'Samuel','Osewa','1991-04-17','GB','male'),
(2,'Remigiusz','Olszewski','1992-09-20','Poland','male'),
(NULL,'Yazaldes','Nascimento','1986-10-12','Portugal','male');

# Zgłoszenie zawodników (100m mezczyzn)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id, 1, 1 			# id meetingu = 1 id 100m male = 1
FROM athletes 
WHERE athlete_id >= 16 ;			# Wyzej dodani zawodnicy mają id zaczynające sie od 16

#Utworzenie serii - 8 zawodników - wystarczy jedna seria		id serii - 3 select series_id from series where discipline_id = 1 AND meeting_id = 1 AND s_type = 'final';
INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (1,1,'final');

# Umieszczenie wyników
INSERT INTO track_results (athlete_id, series_id, result) 
VALUES (16,3,'00:00:10.22'),(17,3,'00:00:10.38'),(18,3,'00:00:10.42'),(19,3,'00:00:10.42'),(20,3,'00:00:10.42'),(21,3,'00:00:10.49'),(22,3,'00:00:10.8'),(23,3,NULL);

# Początkowe dodanie zawodników(100m kobiet)

INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(15,'Ewa','Swoboda','1997-07-26','Poland','female'),
(NULL,'Quanesha','Burks','1995-03-15','USA','female'),
(NULL,'Luca','Kozak','1996-06-01','Hungary','female'),
(NULL,'Nooralotta','Neziri','1992-11-09','Finland','female'),
(17,'Ada','Kołodziej','1995-03-24','Poland','female'),
(2,'Marika','Popowicz-Drapała','1988-04-28','Poland','female'),
(NULL,'Yana','Kachur','1997-01-13','Ukraine','female');

# Poprawka
UPDATE disciplines
SET discipline = '100m'
WHERE discipline = '100';

# Zgłoszenie zawodników (100m kobiet)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,2			# id 100m Kobiet = 2
FROM athletes
WHERE athlete_id >= 24;

select * from signups where discipline_id = 10;

#Utworzenie serii - 7 zawodniczek - wystarczy jedna seria		id serii - 4 select series_id from series where discipline_id = 2 AND meeting_id = 1 AND s_type = 'final';
INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (2,1,'final');

# Umieszczenie wyników
INSERT INTO track_results (athlete_id, series_id, result) 
VALUES (24,4,'00:00:11.29'),(25,4,'00:00:11.52'),(26,4,'00:00:11.66'),(27,4,'00:00:11.69'),(28,4,'00:00:11.84'),(29,4,'00:00:11.84'),(30,4,'00:00:11.96');

# Początkowe dodanie zawodników(1500m Kobiet)

ALTER TABLE athletes AUTO_INCREMENT = 31;			#Poprawka nie udało sie dodac zawodnikow, ale autoincrement sie zwiekasz, wiec wracam do 31 ( jak odpalisz skrypt to nie ma znaczenia chyba)
DELETE FROM athletes where athlete_id > 30;

INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(NULL,'Shannon','Osika','1993-06-15','USA','female'),
(NULL,'Dariya','Barysevich','1999-04-06','Belarus','female'),
(NULL,'Diana','Mezulianikova ','1992-04-10','Czech Republic','female'),
(NULL,'Beyenu','Degefu','1999-07-12','Ethiopia','female'),
(20,'Katarzyna','Jankowska','1994-01-14','Poland','female'),
(5,'Sofia','Ennaoui','1997-01-01','Poland','female'),
(NULL,'Betlehem','Desalegn','1991-11-13','United Arab Emirates','female');


# Zgłoszenie zawodników (1500m kobiet)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,10			# id 1500m Kobiet = 10
FROM athletes
WHERE athlete_id >= 31;

#Utworzenie serii - 7 zawodniczek - wystarczy jedna seria		id serii - 5 select series_id from series where discipline_id = 2 AND meeting_id = 1 AND s_type = 'final';
INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (10,1,'final');

# Umieszczenie wyników
INSERT INTO track_results (athlete_id, series_id, result) 
VALUES (31,5,'00:04:01.80'),(32,5,'00:04:10.75'),(33,5,'00:04:12.83'),(34,5,'00:04:17.12'),(35,5,'00:04:17.29'),(36,5,'00:04:20.53'),(37,5,NULL);


# Początkowe dodanie zawodników(1000m M)

INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(2,'Marcin','Lewandowski','1987-06-13','Poland','male'),
(6,'Adam','Kszczot','1989-09-02','Poland','male'),
(19,'Michał','Rozmys','1995-09-02','Poland','male'),
(Null,'Andrew','Osagie','1988-02-19','GB','male'),
(Null,'Nikolay','Verbitskiy','1990-04-13','Bosnia and Herzegovina','male'),
(Null,'Ali','Mohamed','1988-02-17','Dijbouti','male'),
(Null,'Norbert','Kolombos','1995-02-23','Kenya','male'),
(8,'Kacper','Kozłowski','1986-03-22','Poland','male');

# Zgłoszenie zawodników (1000m M)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,23			# id 1000m M = 23
FROM athletes
WHERE athlete_id >= 38;

#Utworzenie serii - 8 zawodnikow - wystarczy jedna seria		id serii - 6 select series_id from series where discipline_id = 2 AND meeting_id = 1 AND s_type = 'final';
INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (23,1,'final');

# Umieszczenie wyników
INSERT INTO track_results (athlete_id, series_id, result) 
VALUES (38,6,'00:02:21.01'),(39,6,'00:02:21.42'),(40,6,'00:02:21.72'),(41,6,'00:02:22.83'),(42,6,'00:02:22.96'),(43,6,'00:02:23.95'),(44,6,'00:02:24.27'),(45,6,'00:02:24.75');

# Początkowe dodanie zawodników(400m M)

INSERT INTO athletes (club_id ,first_name ,last_name ,birth ,nationality ,sex) VALUES
(NULL,'Steven','Gardiner','1995-09-12','Bahamas','male'),
(NULL,'Yousif','Rabah','1986-11-12','GB','male'),
(NULL,'Tyrell','Richard','1997-08-04','USA','male'),
(3,'Rafał','Omelko','1989-01-16','Poland','male'),
(4,'Jakub','Krzewina','1989-10-10','Poland','male'),
(Null,'Dwayne','Cowan','1985-01-01','GB','male'),
(15,'Karol','Zalewski','1993-02-23','Poland','male'),
(4,'Łukasz','Krawczuk','1989-06-15','Poland','male'),
(4,'Tymoteusz','Zimny','1998-03-14','Poland','male');

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,5			# id 400m M = 
FROM athletes
WHERE athlete_id >= 46;

INSERT INTO series (discipline_id, meeting_id,s_type)
VALUES (5,1,'final');		# id serii - 7

INSERT INTO track_results (athlete_id, series_id, result) 
VALUES (46,7,'00:00:44.14'),(47,7,'00:00:46.02'),(48,7,'00:00:46.27'),(49,7,'00:00:46.28'),(50,7,'00:00:46.37'),(51,7,'00:00:46.61'),(52,7,'00:00:46.63'),(53,7,'00:00:46.75'),(54,7,'00:00:47.77');
#->	

#SELECT * FROM clubs;
/*
#Select club_id, c_name from clubs;
#select * from arenas;
#select * from meetings;
#select * from disciplines;
#select * from athletes ORDER BY athlete_id;

select s.athlete_id, s.meeting_id, s.discipline_id, a.last_name from signups s 
JOIN athletes a ON a.athlete_id = s.athlete_id 
WHERE s.meeting_id = 1 AND s.discipline_id = 21;

select * from series;
select * from jump_results;
select athlete_id from athletes where first_name = 'Isiah';
*/
select * from athletes;
select * from signups WHere meeting_id = 1 AND discipline_id = 2;