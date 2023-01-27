DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan_tb(
      id_plan INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
      name_plan VARCHAR(45) NOT NULL,
      price_plan DECIMAL(6,2) NOT NULL
  ) ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.artist_tb (
      id_artist INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      name_artist VARCHAR(200) NULL
  ) ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.user_tb (
      id_user INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      name_user VARCHAR(200) NOT NULL,
      birth_user DATE NULL,
      id_plan INT NULL,
      subscription_plan DATE NULL,
    FOREIGN KEY (id_plan)
      REFERENCES SpotifyClone.plan_tb (id_plan)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
  ) ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.album_tb (
      id_album INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      name_album VARCHAR(200) NOT NULL,
      release_album DATE NULL,
      id_artist INT NOT NULL,
    FOREIGN KEY (id_artist)
      REFERENCES SpotifyClone.artist_tb (id_artist)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
  ) ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.user_artist_tb (
      id_user INT NOT NULL,
      id_artist INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_user, id_artist),
      FOREIGN KEY (id_user)
      REFERENCES SpotifyClone.user_tb (id_user)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
      FOREIGN KEY (id_artist)
      REFERENCES SpotifyClone.artist_tb (id_artist)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
  ) ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.song_tb (
      id_song INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      title_song VARCHAR(200) NOT NULL,
      duration_song_s INT NULL,
      id_album INT NOT NULL,
    FOREIGN KEY (id_album)
      REFERENCES SpotifyClone.album_tb (id_album)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
  ) ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.history_tb (
      id_user INT NOT NULL,
      id_song INT NOT NULL,
      play_history DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PRIMARY KEY (id_user, id_song),
      FOREIGN KEY (id_user)
      REFERENCES SpotifyClone.user_tb (id_user)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
      FOREIGN KEY (id_song)
      REFERENCES SpotifyClone.song_tb (id_song)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
  ) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.plan_tb (name_plan, price_plan)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('pessoal', 6.99),
    ('universitário', 5.99);

  INSERT INTO SpotifyClone.artist_tb (name_artist)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.user_tb (name_user, birth_user, id_plan, subscription_plan)
  VALUES
    ('Barbara Liskov', 19411020, 1, 20191020),
    ('Robert Cecil Martin',	19650106,	1,	20170106),
    ('Ada Lovelace',	19861230,	2,	20171230),
    ('Martin Fowler',	19770117,	2,	20170117),
    ('Sandi Metz',	19650429,	2,	20180429),
    ('Paulo Freire',	20040214,	4,	20180214),
    ('Bell Hooks',	19970105,	4,	20180105),
    ('Christopher Alexander',	19380605,	3,	20190605),
    ('Judith Butler',	19780513,	3,	20200513),
    ('Jorge Amado',	19650217,	3,	20170217);

  INSERT INTO SpotifyClone.album_tb (name_album, release_album, id_artist)
  VALUES
    ('Renaissance', 20221020, 1),
    ('Jazz',	19780106,	2),
    ('Hot Space',	19821230,	2),
    ('Falso Brilhante',	19980117,	3),
    ('Vento de Maio',	20010429,	3),
    ('QVVJFA?',	20030214,	4),
    ('Somewhere Far Beyond',	20070105,	5),
    ('I Put A Spell On You',	20120605,	6);    

  INSERT INTO SpotifyClone.song_tb (title_song, duration_song_s, id_album)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE',	369,	1),
    ('ALIEN SUPERSTAR',	116,	1),
    ('Don’t Stop Me Now',	203,	2),
    ('Under Pressure',	152,	3),
    ('Como Nossos Pais',	105,	4),
    ('O Medo de Amar é o Medo de Ser Livre',	207,	5),
    ('Samba em Paris',	267,	6),
    ('The Bard’s Song',	244,	7),
    ('Feeling Good',	100,	8);

  INSERT INTO SpotifyClone.history_tb (id_user, id_song, play_history)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1,	2,	'2020-05-02 05:30:35'),
    (1,	10,	'2020-03-06 11:22:33'),
    (2,	10,	'2022-08-05 08:05:17'),
    (2,	7,	'2020-01-02 07:40:33'),
    (3,	10,	'2020-11-13 16:55:13'),
    (3,	2,	'2020-12-05 18:38:30'),
    (4,	8,	'2021-08-15 17:10:10'),
    (5,	8,	'2022-01-09 01:44:33'),
    (5,	5,	'2020-08-06 15:23:43'),
    (6,	7,	'2017-01-24 00:31:17'),
    (6,	1,	'2017-10-12 12:35:20'),
    (7,	4,	'2011-12-15 22:30:49'),
    (8,	4,	'2012-03-17 14:56:41'),
    (9,	9,	'2022-02-24 21:14:22'),
    (10,	3,	'2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.user_artist_tb (id_user, id_artist)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 6),
    (5, 5),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
