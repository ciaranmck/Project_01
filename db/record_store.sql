DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 primary key,
  title VARCHAR(255),
  quantity INT4,
  artist_id INT4 REFERENCES artists(id)
);