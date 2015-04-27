psql

CREATE DATABASE restaurantApp;

\c restaurantApp

CREATE TABLE food (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  cuisine VARCHAR (255),
  price VARCHAR (255),
  allergens VARCHAR (255)
);

CREATE TABLE party (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  guests INTEGER,
  paid BOOLEAN
);

CREATE TABLE table_order (
  id SERIAL PRIMARY KEY,
  reciept VARCHAR (255),
  total INTEGER,
  table_id INTEGER,
  food_id INTEGER
);

-- SELECT * FROM food;
-- SELECT * FROM party;
-- SELECT * FROM table_order;
