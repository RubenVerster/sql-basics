CREATE DATABASE record_company;
USE record_company;
CREATE TABLE test (test_column INT)
ALTER TABLE test ADD another_column VARCHAR(255);
DROP TABLE test;

CREATE TABLE bands (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY_KEY (id)
  );

  CREATE TABLE albums (
    id INT NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY_KEY (id),
    FOREIGN_KEY (band_id) REFERENCES band(id)
  )

INSERT INTO bands (name) VALUES ('Iron Maiden');
INSERT INTO bands (name) VALUES ('Metallica'), ('Kool & The Gang'), ('Avenged Sevenfold');

SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;
SELECT id as 'ID', name AS 'Band Name' FROM bands;

SELECT * FROM bands ORDER BY name;
SELECT * FROM bands ORDER BY name DESC;
SELECT * FROM bands ORDER BY name ASC;

INSERT INTO albums (name, release_year, band_id) 
VALUES 
('The Number Of The Beast', 1998, 1),
('Power Slave', 1984, 1),
('One', 1999, 2),
('Hollywood Swining', 2001, 3), 
('TEST ALBUM', 9999, 3), 

SELECT * FROM albums;
SELECT DISTINCT name FROM albums ;

UPDATE albums SET release_year = 1982 WHERE id = 1;

SELECT * FROM albums WHERE release_year > 2000;
SELECT * FROM albums WHERE name LIKE '%er%' OR band_id = 2;
SELECT * FROM albums WHERE release_year = 1982 AND band_id = 1;
SELECT * FROM albums WHERE release_year BETWEEN 2000 AND 2018;
SELECT * FROM albums WHERE release_year IS NULL;
DELETE FROM albums WHERE id = 5 OR release_year IS NULL;

SELECT * FROM  bands JOIN albums ON bands.id = albums.band_id;

-- INNER JOIN joins a table when there are matching id's found
SELECT * FROM  bands INNER JOIN albums ON bands.id = albums.band_id;

-- LEFT JOIN joins a table on the left side even if there is no matching id found
SELECT * FROM  bands LEFT JOIN albums ON bands.id = albums.band_id;

-- RIGHT JOIN joins a table on the right side. Similar to INNER JOIN
SELECT * FROM  bands LEFT JOIN albums ON bands.id = albums.band_id;

SELECT AVG(release_year) FROM albums;
SELECT SUM(release_year) FROM albums;

-- this selects the band id and then counts how many entries that band id has and displays it in a col
-- entries are then grouped by the band id
SELECT band_id, COUNT(band_id) FROM albums GROUP BY band_id;

-- selects the band names and the count of the albums from the bands table
-- also renaming bands table to shorthand
SELECT b.name AS band_name, COUNT(a.id) AS num_albums FROM bands AS b 
-- joins the albums on the left where the band id is equal to the foreign key in the album table
-- also renaming albums table to shorthand
LEFT JOIN albums AS a ON b.id = a.band_id
-- then we group the entries by the band id
GROUP BY b.id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums FROM bands AS b 
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
-- this is like the WHERE command, but for complex queries
-- you can't use a WHERE command in the start of these commands because the data is still being generated
-- so you have to use the HAVING command to filter it afterwards
HAVING num_albums = 1;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums FROM bands AS b 
LEFT JOIN albums AS a ON b.id = a.band_id
-- the HAVING command references the aggregate data from the COUNT, so you can use WHERE only on the band_name
WHERE b.name = 'Iron Maiden'
GROUP BY b.id
HAVING num_albums > 1;









