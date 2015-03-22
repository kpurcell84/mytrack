-- Erase existing schema and set up a new one

DROP DATABASE if EXISTS mytrack;
CREATE DATABASE mytrack;

USE mytrack;

CREATE TABLE User (
	username VARCHAR(20) NOT NULL,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
	email VARCHAR(40) NOT NULL,
	active ENUM('yes', 'no') NOT NULL,
	PRIMARY KEY (username)
);

CREATE TABLE Album (
	albumid INTEGER NOT NULL AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	created DATE NOT NULL,
	lastupdated DATE NOT NULL,
	username VARCHAR(20) NOT NULL,
	access ENUM('public', 'private') NOT NULL,
	PRIMARY KEY (albumid),
	FOREIGN KEY (username) REFERENCES User(username) ON DELETE CASCADE
);

CREATE TABLE Photo (
	picid VARCHAR(40) NOT NULL,
	url VARCHAR(255) NOT NULL,
	format CHAR(3) NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (picid)
);

CREATE TABLE Contain (
	albumid INTEGER NOT NULL,
	picid VARCHAR(40) NOT NULL,
	caption VARCHAR(255) NOT NULL,
	sequencenum INTEGER NOT NULL,
	PRIMARY KEY (albumid, picid),
	FOREIGN KEY (albumid) REFERENCES Album(albumid) ON DELETE CASCADE,
	FOREIGN KEY (picid) REFERENCES Photo(picid) ON DELETE CASCADE
);

CREATE TABLE AlbumAccess (
	albumid INTEGER NOT NULL,
	username VARCHAR(20) NOT NULL,	
	PRIMARY KEY (albumid, username),
	FOREIGN KEY (albumid) REFERENCES Album(albumid) ON DELETE CASCADE,
	FOREIGN KEY (username) REFERENCES User(username) ON DELETE CASCADE
);