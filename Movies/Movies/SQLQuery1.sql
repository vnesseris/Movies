--DECLARE @duration FORMAT(TIME,N'hh\:mm');
CREATE TABLE movies(
id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(MAX),
year INTEGER,
category VARCHAR(MAX),
star VARCHAR(MAX),
imdb_rating REAL,
duration TIME);


--Inserting movies in the table movies
INSERT INTO movies
VALUES (  'Madrid, 1987', 2011, 'Drama', 'Jose Sacristan, Maria Valverde', 6.4, '1:45'),
		( '1984', 1984, 'Drama', 'John Hurt, Richard Burton', 7.1, '1:53'),
		( 'Titanic', 1997, 'Drama', 'Leonardo DiCaprio, Kate Winslet', 7.8, '3:14'),
		( 'The Revenant', 2015, 'Action', 'Leonardo DiCaprio, Tom Hardy', 8.0, '2:36'),
		( 'The Hangover', 2009,'Comedy', 'Zak Galifianakis, Bradley Cooper', 7.7, '1:40'),
		( 'Batman v Superman: Dawn of Justice',  2016, 'Action', 'Ben Affleck, Henry Cavill', 6.4,'2:32'),
		( '17 Again', 2009, 'Comedy','Zac Efron, Matthew Perry', 6.3, '1:42'),
		( 'The Avengers', 2012,  'Action', 'Robert Downey Jr., Chris Evans', 8.0, '2:23'),
		( 'Black Panther', 2018,  'Action', 'Chadwick Boseman, Michael B.Jordan', 7.3, '2:14'),
		( 'The Green Mile', 1999, 'Crime', 'Tom Hanks, Michael Clarke Duncan', 8.6, '3:09'),
		( 'The Mountain Between Us', 2017, 'Action', 'Kate Winslet, Idris Elba', 6.4, '1:52'),
		( 'Bohemian Rhapsody', 2018, 'Biography', 'Rami Malek, Lucy Boynton', 8.0, '2:14'),
		( 'Reasonable Doubt', 2014, 'Crime', 'Dominic Cooper, Samuel L.Jackson', 5.7, '1:31'),
		( 'Coming to America', 1988, 'Comedy', 'Eddie Murphy, Paul Bates', 7.0, '1:56'),
		( 'Inception', 2010, 'Action', 'Leonardo DiCaprio', 8.8, '2:28');

INSERT INTO movies
VALUES ( 'The Omega Man', 1971, 'Action', 'Charlton Heston, Anthony Zerbe', 6.5, '01:38');

INSERT INTO movies
VALUES ( 'Insomnia', 2002, 'Drama', 'Al Pacino, Robin Williams', 7.2, '01:58'),
		( 'Avatar', 2009, 'Action', 'Sam Worthington, Zoe Saldana', 7.8, '02:42'),
		( 'Dunkirk', 2017, 'Action', 'Fion Whitehead, Barry Keoghan', 7.8, '01:46'),
		( 'Creed', 2015, 'Drama', 'Michael B.Jordan, Sylvester Stallone', 7.6, '02:13');

SELECT * FROM movies;

--Create new table named comedies and insert the comedies of table movies into table comedies
SELECT * INTO comedies
FROM movies
WHERE category = 'Comedy';

--Insert new comedy to movies
INSERT INTO movies 
VALUES ('Top Secret', 1984, 'Comedy', 'Val Kilmer, Lucy Gutteridge', 7.2, '1:30');

-- Search for comedies in table movies that are not included in table comedies. If there is any, insert it into table comedies
INSERT INTO comedies( comedies.name, comedies.year, comedies.category, comedies.star, comedies.imdb_rating, comedies.duration)
SELECT  movies.name, movies.year, movies.category, movies.star, movies.imdb_rating, movies.duration FROM movies
LEFT JOIN comedies on movies.name = comedies.name
WHERE movies.category = 'comedy' AND comedies.name IS NULL;

SELECT * FROM comedies;

-- Categorize movies based on their ratings
SELECT *,
CASE WHEN imdb_rating >= 8 THEN 'Great'
 WHEN imdb_rating < 8 AND imdb_rating >= 7 THEN 'Good'
 WHEN imdb_rating < 7 AND imdb_rating >= 6 THEN 'Decent'
 WHEN imdb_rating < 6 AND imdb_rating >= 5 THEN 'Mediocre'
ELSE  'Failure'
END AS Comment
 FROM movies
 ORDER BY Comment;

 --Selecting movies where Leonardo DiCaprio or Tom Hanks starred in
 SELECT * FROM movies
 WHERE star LIKE '%Leonardo DiCaprio%' OR star LIKE '%Tom Hanks%'
 ORDER BY star;

 --Selecting top 5 rated movies
 SELECT TOP 5 * FROM movies
 ORDER BY imdb_rating DESC;

 --Creating a table called directors
 CREATE TABLE directors
 (id INTEGER NOT NULL IDENTITY(1,1)PRIMARY KEY,
 name VARCHAR(MAX));



 --Insert directors in the new table
INSERT INTO directors
VALUES ('David Trueba'),
		('Ryan Coogler'),
		( 'John Landis'),
		( 'Hang Abu-Assad'),
		( 'Christopher Nolan'),
		('Peter Howitt'),
		( 'James Cameron'),
		( 'Michael Radford'),
		( 'Alejandro G.Inarritu'),
		( 'Zack Snyder'),
		( 'Bryan Singer'),
		( 'Boris Sagal'),
		( 'Jim Abrahams'),
		( 'Frank Darabont'),
		( 'Joss Whedon'),
		( 'Burr Steers'),
		( 'Todd Phillips');

SELECT * FROM directors;

--Inserting a new column in the movies table with the director's id
ALTER TABLE movies
ADD director_id INTEGER FOREIGN KEY REFERENCES directors;

--Updating table movies with the directors' id
UPDATE movies SET director_id = 1 WHERE movies.id = 1
GO
UPDATE movies SET director_id = 8  WHERE movies.id = 2
GO 
UPDATE movies SET director_id = 7 WHERE movies.id = 3
GO
UPDATE movies SET director_id = 9 WHERE movies.id = 4
GO
UPDATE movies SET director_id = 17 WHERE movies.id = 5
GO
UPDATE movies SET director_id = 10  WHERE movies.id = 6
GO 
UPDATE movies SET director_id = 16 WHERE movies.id = 7
GO
UPDATE movies SET director_id = 15 WHERE movies.id = 8
GO
UPDATE movies SET director_id = 2 WHERE movies.id = 9
GO
UPDATE movies SET director_id = 14  WHERE movies.id = 10
GO 
UPDATE movies SET director_id = 4 WHERE movies.id = 11
GO
UPDATE movies SET director_id = 11 WHERE movies.id = 12
GO
UPDATE movies SET director_id = 6 WHERE movies.id = 13
GO
UPDATE movies SET director_id = 3  WHERE movies.id = 14
GO 
UPDATE movies SET director_id = 5 WHERE movies.id = 15
GO
UPDATE movies SET director_id = 12 WHERE movies.id = 16
GO
UPDATE movies SET director_id = 13 WHERE movies.id = 17
GO
UPDATE movies SET director_id = 7  WHERE movies.id = 18
GO 
UPDATE movies SET director_id = 5 WHERE movies.id = 19
GO
UPDATE movies SET director_id = 2 WHERE movies.id = 20
GO
UPDATE movies SET director_id = 5 WHERE movies.id = 21
GO

--Selecting the top rated movie of Christopher Nolan
SELECT TOP 1* FROM movies
JOIN directors ON movies.director_id = directors.id
WHERE directors.name = 'Christopher Nolan'
ORDER BY movies.imdb_rating DESC;

SELECT * FROM movies;

--Create a new table that contains favourite movies
CREATE TABLE favourite_movies
(name VARCHAR(MAX),
id INTEGER FOREIGN KEY REFERENCES movies,
director_id INTEGER FOREIGN KEY REFERENCES directors);

INSERT INTO favourite_movies
VALUES ('Black Panther', 9, 2),
		('The Green Mile', 10, 14),
		('Resonable Doubt', 13, 6),
		('Coming to America', 14, 3),
		('Dunkirk', 19, 5),
		('Creed', 20, 2);

SELECT * FROM favourite_movies;

--Select movies from longest to shortest
SELECT favourite_movies.name, movies.star, directors.name, FORMAT(movies.duration, 'hh\:mm') AS 'duration'
FROM favourite_movies
JOIN movies ON favourite_movies.id = movies.id
JOIN directors ON favourite_movies.director_id = directors.id
ORDER BY duration DESC;

--Select the best rated of my favourite movies
SELECT TOP 1 favourite_movies.name, movies.star, directors.name, movies.imdb_rating
FROM favourite_movies
JOIN movies ON favourite_movies.id = movies.id
JOIN directors ON favourite_movies.director_id = directors.id
ORDER BY movies.imdb_rating DESC;

--Select the worst rated of my favourite movies
SELECT TOP 1 favourite_movies.name, movies.star, directors.name, movies.imdb_rating
FROM favourite_movies
JOIN movies ON favourite_movies.id = movies.id
JOIN directors ON favourite_movies.director_id = directors.id
ORDER BY movies.imdb_rating ASC;

