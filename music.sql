DROP TABLE IF EXISTS music_pharaoh;

CREATE TABLE music_pharaoh (
    id INT PRIMARY KEY,
    title VARCHAR(50),
    album_name VARCHAR(50),
    creator VARCHAR(20),
    release_year SMALLINT,
    genre VARCHAR(20),
    rating DECIMAL(3, 1),
    listens_millions INT
);

INSERT INTO music_pharaoh (id, title, album_name, creator, release_year, genre, rating, listens_millions)
VALUES
  (1, 'Black Siemens', 'Single', 'PHARAOH', 2015, 'Cloud Rap', 8.8, 85),
  (2, '5 минут назад', 'Плакшери', 'PHARAOH', 2016, 'Hip-Hop', 9.0, 110),
  (3, 'Дико, например', 'Pink Phloyd', 'PHARAOH', 2017, 'Trap', 9.3, 140),
  (4, 'Smart', 'PHUNERAL', 'PHARAOH', 2018, 'Emo Rap', 8.5, 60),
  (5, 'Не по пути', 'Single', 'PHARAOH', 2018, 'Cloud Rap', 8.7, 45);