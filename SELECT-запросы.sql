/* Задание 2 */
SELECT track_name, duration
FROM track
ORDER BY duration DESC
LIMIT 1;


SELECT track_name
FROM track
WHERE duration >= 210;


SELECT collection_name
FROM collection
WHERE collection_year BETWEEN 2018 AND 2020;


SELECT artist_name
FROM artist
WHERE artist_name NOT LIKE '% %';

/* Разные способы решения последнего номера */
SELECT track_name
FROM track
WHERE string_to_array(lower(track_name), ' ') && ARRAY['my', 'мой'];


SELECT track_name
FROM track
WHERE track_name  ~* '\m(my|мой)\M'


SELECT track_name
FROM track
WHERE track_name ILIKE 'мой %'
OR track_name ILIKE '% мой'
OR track_name ILIKE '% мой %'
OR track_name ILIKE 'мой'
OR track_name ILIKE 'my %'
OR track_name ILIKE '% my'
OR track_name ILIKE '% my %'
OR track_name ILIKE 'my';




/* Задание 3 */
SELECT g.genre_name, COUNT(ga.artistid) AS artist_count
FROM genre g
JOIN genre_artist ga ON g.genreid = ga.genreid
GROUP BY g.genre_name


INSERT INTO genre (genreid, genre_name) VALUES
(4, 'Electropop');


INSERT INTO artist (artistid, artist_name) VALUES
(6, 'Billie Eilish');


INSERT INTO genre_artist (genreid, artistid) VALUES
(4, 6);


INSERT INTO album (albumid, album_name, album_year) VALUES
(4, 'Future Sounds', 2019);


INSERT INTO artist_album (artistid, albumid) VALUES
(6, 4);


INSERT INTO track (trackid, track_name, duration, albumid) VALUES
(7, 'New Era', 245, 4),
(8, 'Tomorrow', 300, 4);


SELECT COUNT(t.trackid) AS track_count
FROM track t
JOIN album a ON t.albumid = a.albumid
WHERE a.album_year BETWEEN 2019 AND 2020;


SELECT a.album_name, AVG(t.duration) AS avg_duration
FROM album a
JOIN track t ON a.albumid = t.albumid 
GROUP BY a.album_name


SELECT DISTINCT ar.artist_name
FROM artist ar
WHERE ar.artistid NOT IN (
	SELECT aa.artistid
	FROM artist_album aa
	JOIN album al ON aa.albumid = al.albumid
	WHERE al.album_year = 2020
);


SELECT DISTINCT c.collection_name
FROM collection c
JOIN collection_track ct ON c.collectionid = ct.collectionid
JOIN track t ON ct.trackid = t.trackid
JOIN album a ON t.albumid = a.albumid
JOIN artist_album aa ON a.albumid = aa.albumid
JOIN artist a1 ON aa.artistid = a1.artistid
WHERE a1.artist_name = 'Freddie Mercury';




/* Задание 4 */
INSERT INTO artist (artistid, artist_name) VALUES
(7, 'John Doe'),
(8, 'Jane Smith');


INSERT INTO genre_artist (genreid, artistid) VALUES
(1, 7),
(2, 8);


INSERT INTO album (albumid, album_name, album_year) VALUES
(5, 'Multi-Genre Album', 2020),
(6, 'Rock Classics', 2019);


INSERT INTO artist_album (artistid, albumid) VALUES
(7, 5),
(8, 5);


INSERT INTO track (trackid, track_name, albumid, duration) VALUES
(9, 'Genre Fusion', 5, 225),
(10, 'Classic Rock Hit', 6, 260);

/* Исправил запрос, уточнив группировку */
SELECT al.album_name
FROM album al
JOIN artist_album aa ON al.albumid = aa.albumid 
JOIN genre_artist ga ON aa.artistid = ga.artistid 
GROUP BY al.album_name, aa.artistid
HAVING COUNT(DISTINCT ga.genreid) > 1;


SELECT t.track_name
FROM track t
LEFT JOIN collection_track ct ON t.trackid = ct.trackid
WHERE ct.trackid IS NULL;


SELECT DISTINCT ar.artist_name
FROM artist ar
JOIN artist_album aa ON ar.artistid = aa.artistid
JOIN album al ON aa.albumid = al.albumid 
JOIN track t ON al.albumid = t.albumid 
WHERE t.duration = (SELECT MIN(duration) FROM track);


SELECT al.album_name
FROM album al
JOIN track t ON al.albumid = t.albumid
GROUP BY al.albumid
HAVING COUNT(t.trackid) = (
	SELECT MIN(track_count)
	FROM (
		SELECT COUNT(t.trackid) AS track_count
		FROM track t
		GROUP BY t.albumid
	)
);