CREATE DATABASE IF NOT EXISTS mydb;
/* CREATE USER IF NOT EXISTS 'user' @'%' IDENTIFIED BY 'password'; */
GRANT SELECT,
  UPDATE,
  INSERT ON mydb.* TO 'user' @'%';
FLUSH PRIVILEGES;
USE mydb;
/*
 It appends on every run which is not initially expected.
 Dropping.
 */
DROP TABLE IF EXISTS regions;
CREATE TABLE IF NOT EXISTS regions (
  region VARCHAR(100) NOT NULL,
  maincity VARCHAR(50) NOT NULL,
  population INT (10) NOT NULL
);
INSERT INTO regions (region, maincity, population)
VALUES (
    'New York',
    'New York City',
    '8398748'
  ),
  (
    'Pennsylvania',
    'Philadelphia',
    '1584138'
  ),
  (
    'Massachusetts',
    'Boston',
    '694583'
  ),
  ('New Jersey', 'Newark', '282090'),
  (
    'Connecticut',
    'Hartford',
    '123400'
  ),
  (
    'Maryland',
    'Baltimore',
    '602495'
  ),
  ('Virginia', 'Richmond', '228783'),
  (
    'North Carolina',
    'Raleigh',
    '469298'
  );
