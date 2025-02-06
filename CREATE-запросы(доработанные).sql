CREATE TABLE Genre (
    genreID SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE Artist (
    artistID SERIAL PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE Genre_Artist (
    genreID INT NOT NULL,
    artistID INT NOT NULL,
    PRIMARY KEY (genreID, artistID),
    FOREIGN KEY (genreID) REFERENCES Genre (genreID) ON DELETE CASCADE,
    FOREIGN KEY (artistID) REFERENCES Artist (artistID) ON DELETE CASCADE
);


CREATE TABLE Album (
    albumID SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    album_year INT NOT NULL CHECK (album_year >= 1900)
);


CREATE TABLE Artist_Album (
    artistID INT NOT NULL,
    albumID INT NOT NULL,
    PRIMARY KEY (artistID, albumID),
    FOREIGN KEY (artistID) REFERENCES Artist (artistID) ON DELETE CASCADE,
    FOREIGN KEY (albumID) REFERENCES Album (albumID) ON DELETE CASCADE
);


CREATE TABLE Track (
    trackID SERIAL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    albumID INT NOT NULL,
    FOREIGN KEY (albumID) REFERENCES Album (albumID) ON DELETE CASCADE
);


CREATE TABLE Collection (
    collectionID SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    collection_year INT NOT NULL CHECK (collection_year >= 1900)
);


CREATE TABLE Collection_Track (
    collectionID INT NOT NULL,
    trackID INT NOT NULL,
    PRIMARY KEY (collectionID, trackID),
    FOREIGN KEY (collectionID) REFERENCES Collection (collectionID) ON DELETE CASCADE,
    FOREIGN KEY (trackID) REFERENCES Track (trackID) ON DELETE CASCADE
);