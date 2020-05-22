# Utworzenie meetingu

INSERT INTO meetings (rank_id,arena_id,m_date,m_description)
VALUES ('usual','StadionŚląski','2020-05-05','S_test');

select * from meetings;  # znalezienie id nowo utworzonego meetingu

# N = ...

#Zgloszenie zawodnikow ( zglaszamy 20 zawodnikow  z id od 1 do 20 do skoku o tyczce)
INSERT INTO signups (athlete_id, meeting_id, discipline_id)   
SELECT athlete_id, N, 21 			# id meetingu = N id tyczki mezczyzn = 21
FROM athletes 
WHERE athlete_id >= 1 AND athlete_id <=20;

select * from signups;

# Stworzenie serii
SELECT create_series('normal',N,21,18,8,0); 

# N- meeting_id ,
# 21 - discipline_id, 
# 18 - pojemnosc dyscypliny na tych zawodach, 
# 8 - pojemosc serii


# spodziewane 3 serie, poniewaz maks = 18, pojemnosc serii 8 czyli 2(*8) serie nie wystarcza
# z z sign up powinni zostac odrzucenie dwaj zawodnicy


select * from meetings;
select * from series;
select * from signups;

SELECT athlete_id, 2, 21 			# id meetingu = 3 id tyczki mezczyzn = 21
FROM athletes 
WHERE athlete_id >= 1 AND athlete_id <=20;

DELETE FROM series where series_id >=11 AND series_id <=13;
DELETE FROM signups where meeting_id = 4;
DELETE FROM meetings where meeting_id = 4;
