INSERT INTO genre (genreid, genre_name) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz');


INSERT INTO artist (artistid, artist_name) VALUES
(1, 'Freddie Mercury'),
(2, 'Paul McCartney'),
(3, 'John Lennon'),
(4, 'Miles Davis'),
(5, 'Adele');

INSERT INTO genre_artist (genreid, artistid) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(2, 5);


INSERT INTO album (albumid, album_name, album_year) VALUES
(1, 'A Night at the Opera', 1975),
(2, 'Abbey Road', 1969),
(3, 'Kind of Blue', 1959);


INSERT INTO artist_album (artistid, albumid) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 2);


INSERT INTO track (trackid, track_name, duration, albumid) VALUES
(1, 'Bohemian Rhapsody', 354, 1),
(2, 'Love of my life', 221, 1),
(3, 'Come Together', 259, 2),
(4, 'Something', 182, 2),
(5, 'So What', 540, 3),
(6, 'Blue in Green', 328, 3);


INSERT INTO collection (collectionid, collection_name, collection_year) VALUES
(1, 'Greatest Hits Rock', 2000),
(2, 'Best of Pop', 2010),
(3, 'Jazz CLassics', 2015),
(4, 'Legend of Music', 2020);


INSERT INTO collection_track (collectionid, trackid) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 5);
