psql

CREATE DATABASE pos_app;

\c pos_app

CREATE TABLE foods (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  cuisine VARCHAR (255),
  cents INTEGER
);

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  table_number INTEGER,
  is_paid BOOLEAN
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  party_id INTEGER,
  food_id INTEGER
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (255),
  password_hash VARCHAR (255)
);
SELECT * FROM foods;
SELECT * FROM parties;
SELECT * FROM orders;
SELECT * FROM users;

INSERT INTO foods(name) VALUES ('Steak');
INSERT INTO foods(name) VALUES ('Dry aged Steak');
INSERT INTO foods(name) VALUES ('Skirt Steak');
