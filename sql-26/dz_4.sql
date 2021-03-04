DROP DATABASE IF EXISTS almaz_dz_4;
CREATE DATABASE almaz_dz_4;

\c almaz_dz_4;

CREATE TABLE language (
   language_id serial PRIMARY KEY,
   language varchar(255) UNIQUE NOT NULL
);

CREATE TABLE nationality (
   nationality_id serial PRIMARY KEY,
   nationality varchar(255) UNIQUE NOT NULL
);

CREATE TABLE country (
   country_id serial PRIMARY KEY,
   country varchar(255) UNIQUE NOT NULL
);

CREATE TABLE language_nationality (
  language_id serial NOT NULL,
  nationality_id serial NOT NULL,
  CONSTRAINT fk_language FOREIGN KEY(language_id) REFERENCES language(language_id),
  CONSTRAINT fk_nationality FOREIGN KEY(nationality_id) REFERENCES nationality(nationality_id)
);

CREATE TABLE nationality_country (
  nationality_id serial NOT NULL,
  country_id serial NOT NULL,
  CONSTRAINT fk_nationality FOREIGN KEY(nationality_id) REFERENCES nationality(nationality_id),
  CONSTRAINT fk_country FOREIGN KEY(country_id) REFERENCES country(country_id)
);

INSERT INTO language
  VALUES
    (1, 'Русский'),
    (2, 'Украинский'),
    (3, 'Татарский'),
    (4, 'Белорусский'),
    (5, 'Казахский');

INSERT INTO nationality
  VALUES
    (1, 'Русский'),
    (2, 'Украинец'),
    (3, 'Татарин'),
    (4, 'Белорус'),
    (5, 'Казах');

INSERT INTO country
  VALUES
    (1, 'Россия'),
    (2, 'Украина'),
    (3, 'Белоруссия'),
    (4, 'Казахстан'),
    (5, 'Турция');

INSERT INTO language_nationality
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 2),
    (3, 3);

INSERT INTO nationality_country
  VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (4, 3);
