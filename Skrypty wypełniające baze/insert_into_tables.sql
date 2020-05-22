# Wypełnienie tabeli podstawowymi danymi oraz stworzenie 1 meetingu

INSERT INTO ranks VALUES
('international','Najwyższa ranga obiektu, uprawniająca obiekt do rozgrywania na nim
 zawodów takich jak igrzyska olimpijskie czy mistrzostwa świata. Ranga ta pozwala też rozgrywać zawody 
 o niżej randze niż obiektu'),
 ('continental','Ranga uprawniająca obiekt do rozgrywania na nim zawodów na poziomie kontynetalnym -
 różnego typu mistrzostwa kontynetów. Ranga ta pozwala też rozgrywać zawody 
 o niżej randze niż obiektu'),
 ('national','Ranga uprawniająca obiekt do rozgrywania na nim zawodów na poziomie narodowym - 
 mistrzostwa krajów. Ranga ta pozwala też rozgrywać zawody 
 o niżej randze niż obiektu'),
 ('usual','Ranga uprawniająca obiekt do rozgrywania na nim zawodów - podstawowych meetingów. Na obiekcie o 
 tej randze nie ma możliwości zorganizowania imprez mistrzowskich');

INSERT INTO arenas VALUES 
('Agrykola','usual','Poland','Warszawa'),
('Olimpia','national','Poland','Poznań'),
('Słu','national','Poland','Słubice'),
('KraAWF','usual','Poland','Kraków'),
('Suw','continental','Poland','Suwałki'),
('Kal','national','Poland','Kalisz'),
('OlipWro','national','Poland','Wrocław'),
('Żer','usual','Poland','Żerków'),
('KatAWF','continental','Poland','Katowice'),
('StadionŚląski','international','Poland','Chorzów');

INSERT INTO disciplines (discipline, sex, d_description) VALUES
('100m','male','Najkrótszy dystans w biegach lekkoatletycznych na otwartym stadionie 
 (w hali biega się 60 metrów), klasyczny bieg sprinterski. Rekordzistów świata na tym dystansie 
 określa się często mianem „najszybszego mężczyzny/najszybszej kobiety świata”. 
Rywalizacja na tym dystansie przyciąga zawsze wiele uwagi.'),
('100m','female',
'Najkrótszy dystans w biegach lekkoatletycznych na otwartym stadionie (w hali biega się 60 metrów), 
klasyczny bieg sprinterski. Rekordzistów świata na tym dystansie określa się często mianem 
„najszybszego mężczyzny/najszybszej kobiety świata”. 
Rywalizacja na tym dystansie przyciąga zawsze wiele uwagi.'),
('200m','male','Bieg sprinterski rozgrywany zarówno na otwartym stadionie, jak i w hali.'),
('200m','female','Bieg sprinterski rozgrywany zarówno na otwartym stadionie, jak i w hali.'),
('400m','male','Najdłuższy dystans spośród biegów krótkich. Na standardowym stadionie 400 m 
stanowi dokładnie jedno okrążenie stadionu po wewnętrznym torze. W hali jest to dystans dwóch okrążeń.'),
('400m','female','Najdłuższy dystans spośród biegów krótkich. Na standardowym stadionie 400 m 
stanowi dokładnie jedno okrążenie stadionu po wewnętrznym torze. W hali jest to dystans dwóch okrążeń.'),
('800m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. 
Na otwartym stadionie bieg na 800 metrów to dwa okrążenia stadionu. Pierwsze 100 metrów zawodnicy 
biegną po swoich torach, po czym mogą zbiec ku wewnętrznemu torowi.'),
('800m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. 
Na otwartym stadionie bieg na 800 metrów to dwa okrążenia stadionu. Pierwsze 100 metrów zawodnicy 
biegną po swoich torach, po czym mogą zbiec ku wewnętrznemu torowi.'),
('1000m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. Na otwartym stadionie 1000m odpowiada dwa i pół okrążenia.'),
('1000m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. Na otwartym stadionie 1000m odpowiada dwa i pół okrążenia.'),
('1500m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. 
Na otwartym stadionie zawodnicy biegną najpierw 300 m odcinek, a później trzy pełne okrążenia stadionu.'),
('1500m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. 
Na otwartym stadionie zawodnicy biegną najpierw 300 m odcinek, a później trzy pełne okrążenia stadionu.'),
('5000m','male','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy pokonują 
12,5 okrążeń bieżni stadionu bądź 25 okrążeń w hali, choć ten dystans nie jest rozgrywany na 
najważniejszych imprezach halowych. '),
('5000m','female','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy pokonują 
12,5 okrążeń bieżni stadionu bądź 25 okrążeń w hali, choć ten dystans nie jest rozgrywany na 
najważniejszych imprezach halowych.'),
('10000m','male','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy
 pokonują 25 okrążeń bieżni stadionu.'), 
 ('10000m','female','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy
 pokonują 25 okrążeń bieżni stadionu.'),
 ('long jump','male','Konkurencja lekkoatletyczna, w której zawodnicy wykonują rozbieg, 
 odbijają się z jednej nogi z belki i lądują na piaszczystej części skoczni.'),
('long jump','female','Konkurencja lekkoatletyczna, w której zawodnicy wykonują rozbieg, 
 odbijają się z jednej nogi z belki i lądują na piaszczystej części skoczni.'),
 ('high jump','male','Konkurencja lekkoatletyczna, polegająca na odbiciu się (po wykonaniu rozbiegu) i
 przeniesieniu całego ciała ponad poprzeczką zawieszoną na pionowych stojakach. Zawodnicy mają 
 trzy próby na pokonanie danej wysokości.'), 
  ('high jump','female','Konkurencja lekkoatletyczna, polegająca na odbiciu się (po wykonaniu rozbiegu) i
 przeniesieniu całego ciała ponad poprzeczką zawieszoną na pionowych stojakach. Zawodnicy mają 
 trzy próby na pokonanie danej wysokości.'),
 ('triple jump','male','Trójskok – konkurencja lekkoatletyczna, w której zawodnik musi wykonać trzy
 następujące po sobie skoki: pierwszy – odbicie z jednej nogi i lądowanie na nogę odbijającą, 
 drugi – lądowanie na nogę przeciwną, trzeci – lądowanie na piaszczystej skoczni obunóż.
 Zasady rozbiegu, odbicia, lądowania i mierzenia są identyczne jak w skoku w dal. Dwa pierwsze skoki 
 odbywają się na twardej bieżni, trzeci skok kończy się na piasku.'),
  ('triple jump','female','Trójskok – konkurencja lekkoatletyczna, w której zawodnik musi wykonać trzy
 następujące po sobie skoki: pierwszy – odbicie z jednej nogi i lądowanie na nogę odbijającą, 
 drugi – lądowanie na nogę przeciwną, trzeci – lądowanie na piaszczystej skoczni obunóż.
 Zasady rozbiegu, odbicia, lądowania i mierzenia są identyczne jak w skoku w dal. Dwa pierwsze skoki 
 odbywają się na twardej bieżni, trzeci skok kończy się na piasku.'),
 ('pole vault','male','Konkurencja lekkoatletyczna, w której skok odbywa się na takich zasadach 
 jak w skoku wzwyż, z tą różnicą, że zawodnik do pokonania poprzeczki używa tyczki.'),
  ('pole vault','female','Konkurencja lekkoatletyczna, w której skok odbywa się na takich zasadach 
 jak w skoku wzwyż, z tą różnicą, że zawodnik do pokonania poprzeczki używa tyczki.');
 
INSERT INTO meetings (rank_id,arena_id,m_date,m_description) VALUES
('usual','StadionŚląski','2019-09-14','10. Lotto Memoriał Kamili Skolimowskiej');

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

INSERT INTO athletes (club_id, first_name, last_name, birth, nationality, sex) VALUES
(1,'Piotr','Lisek','1992-08-16','Poland','male'),
(2,'Paweł','Wojciechowski','1989-06-06','Poland','male'),
(null,'Bo Kanda Lita','Baehre','1999-04-29','Poland','male'),
(null,'Scott','Houston','1990-06-11','USA','male'),
(null,'Mareks','Arents','1986-08-06','Latvia,','male'),
(null,'Torben','Blech','1995-02-12','Germany','male'),
(3,'Robert','Sobera','1991-01-19','Poland','male'),
(null,'Emmanouil','Karalis','1999-10-20','Greece','male'),
(2,'Karol','Pawlik','1994-03-17','Poland','male'),
(NULL,'Mariya','Lasitskene','1993-01-14','Russia','female'),
(NULL,'Anna','Simic','1990-05-05','Croatia','female'),
(NULL,'Nicola','McDermott','1996-12-28','Austrialia','female'),
(16,'Paulina','Borys','1998-05-14','Poland','female'),
(NULL,'Inika','McPherson','1986-09-29','USA','female'),
(2,'Adrianna','Sułek','1999-04-03','Poland','female'),
(NULL,'Isiah','Young','1990-06-05','USA','male'),
(NULL,'Seye','Ogunlewe','1991-08-30','Nigeria','male'),
(Null,'Brandon','Carnes','1995-03-06','USA','male'),
(Null,'Tommy','Ramdhan','1996-11-28','GB','male'),
(Null,'Sean','Safo-Antwi','1990-01-01','Ghana','male'),
(Null,'Samuel','Osewa','1991-04-17','GB','male'),
(2,'Remigiusz','Olszewski','1992-09-20','Poland','male'),
(NULL,'Yazaldes','Nascimento','1986-10-12','Portugal','male'),
(15,'Ewa','Swoboda','1997-07-26','Poland','female'),
(NULL,'Quanesha','Burks','1995-03-15','USA','female'),
(NULL,'Luca','Kozak','1996-06-01','Hungary','female'),
(NULL,'Nooralotta','Neziri','1992-11-09','Finland','female'),
(17,'Ada','Kołodziej','1995-03-24','Poland','female'),
(2,'Marika','Popowicz-Drapała','1988-04-28','Poland','female'),
(NULL,'Yana','Kachur','1997-01-13','Ukraine','female'),
(NULL,'Shannon','Osika','1993-06-15','USA','female'),
(NULL,'Dariya','Barysevich','1999-04-06','Belarus','female'),
(NULL,'Diana','Mezulianikova ','1992-04-10','Czech Republic','female'),
(NULL,'Beyenu','Degefu','1999-07-12','Ethiopia','female'),
(20,'Katarzyna','Jankowska','1994-01-14','Poland','female'),
(5,'Sofia','Ennaoui','1997-01-01','Poland','female'),
(NULL,'Betlehem','Desalegn','1991-11-13','United Arab Emirates','female'),
(2,'Marcin','Lewandowski','1987-06-13','Poland','male'),
(6,'Adam','Kszczot','1989-09-02','Poland','male'),
(19,'Michał','Rozmys','1995-09-02','Poland','male'),
(Null,'Andrew','Osagie','1988-02-19','GB','male'),
(Null,'Nikolay','Verbitskiy','1990-04-13','Bosnia and Herzegovina','male'),
(Null,'Ali','Mohamed','1988-02-17','Dijbouti','male'),
(Null,'Norbert','Kolombos','1995-02-23','Kenya','male'),
(8,'Kacper','Kozłowski','1986-03-22','Poland','male'),
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
SELECT athlete_id, 1, 21 			# id meetingu = 1, id tyczki mezczyzn = 21
FROM athletes 
WHERE athlete_id >= 1 AND athlete_id <=9;

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id, 1, 18 			# id meetingu = 1, id wzywz kobiet = 18
FROM athletes 
WHERE athlete_id >= 10 ;

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id, 1, 1 			# id meetingu = 1, id 100m mezczyzn = 1
FROM athletes 
WHERE athlete_id >= 16 ;			# Wyzej dodani zawodnicy mają id zaczynające sie od 16

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,2			# id 100m Kobiet = 2
FROM athletes
WHERE athlete_id >= 24;

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,10			# id 1500m Kobiet = 10
FROM athletes
WHERE athlete_id >= 31;

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,9			# id 1000m M = 9
FROM athletes
WHERE athlete_id >= 38;

INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id,1,5			# id 400m M = 
FROM athletes
WHERE athlete_id >= 46;

INSERT INTO series (meeting_id, discipline_id, s_type) VALUES
(1,21,'final'),
(1,18,'final'),
(1,1,'final'),
(1,2,'final'),
(1,10,'final'),
(1,9,'final'),
(1,5,'final');

INSERT INTO jump_results (athlete_id, series_id, result) VALUES
(1,1,5.82),(2,1,5.72),(3,1,5.62),(4,1,5.52),(5,1,5.42),(6,1,5.42),(7,1,5.22),(8,1,NULL),(9,1,NULL),
(10,2,1.94),(11,2,1.90),(12,2,1.90),(13,2,1.80),(14,2,1.80),(15,2,NULL);

INSERT INTO track_results (athlete_id, series_id, result) VALUES
(16,3,'00:00:10.22'),(17,3,'00:00:10.38'),(18,3,'00:00:10.42'),(19,3,'00:00:10.42'),(20,3,'00:00:10.42'),(21,3,'00:00:10.49'),(22,3,'00:00:10.8'),(23,3,NULL),
(24,4,'00:00:11.29'),(25,4,'00:00:11.52'),(26,4,'00:00:11.66'),(27,4,'00:00:11.69'),(28,4,'00:00:11.84'),(29,4,'00:00:11.84'),(30,4,'00:00:11.96'),
(31,5,'00:04:01.80'),(32,5,'00:04:10.75'),(33,5,'00:04:12.83'),(34,5,'00:04:17.12'),(35,5,'00:04:17.29'),(36,5,'00:04:20.53'),(37,5,NULL),
(38,6,'00:02:21.01'),(39,6,'00:02:21.42'),(40,6,'00:02:21.72'),(41,6,'00:02:22.83'),(42,6,'00:02:22.96'),(43,6,'00:02:23.95'),(44,6,'00:02:24.27'),(45,6,'00:02:24.75'),
(46,7,'00:00:44.14'),(47,7,'00:00:46.02'),(48,7,'00:00:46.27'),(49,7,'00:00:46.28'),(50,7,'00:00:46.37'),(51,7,'00:00:46.61'),(52,7,'00:00:46.63'),(53,7,'00:00:46.75'),(54,7,'00:00:47.77');