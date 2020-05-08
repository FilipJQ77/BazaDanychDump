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


#->	

#SELECT * FROM clubs;
/*
#Select club_id, c_name from clubs;
#select * from arenas;
#select * from meetings;
#select * from disciplines;
#select athlete_id from athletes ORDER BY athlete_id;

select s.athlete_id, s.meeting_id, s.discipline_id, a.last_name from signups s 
JOIN athletes a ON a.athlete_id = s.athlete_id 
WHERE s.meeting_id = 1 AND s.discipline_id = 21;

select * from series;
select * from jump_results;
select athlete_id from athletes where first_name = 'Isiah';
*/