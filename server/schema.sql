-----------------------------------
----------DATABASE SCHEMA----------
-----------------------------------


-------------------
---Product Table---
-------------------
DROP TABLE IF EXISTS product CASCADE;

CREATE TABLE IF NOT EXISTS product (
  id INT UNIQUE NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  slogan TEXT NOT NULL,
  description TEXT NOT NULL,
  category VARCHAR(100) NOT NULL,
  default_price VARCHAR(100) NOT NULL
);


--------------------
---Features Table---
--------------------
DROP TABLE IF EXISTS features CASCADE;

CREATE TABLE IF NOT EXISTS features (
  id INT UNIQUE NOT NULL PRIMARY KEY,
  product_id INT NOT NULL REFERENCES product(id),
  feature VARCHAR(100) NOT NULL,
  value VARCHAR(100) NOT NULL
);


-------------------
----Style Table----
-------------------
DROP TABLE IF EXISTS style CASCADE;

CREATE TABLE IF NOT EXISTS style (
  id INT UNIQUE NOT NULL PRIMARY KEY,
  product_id INT NOT NULL REFERENCES product(id),
  name VARCHAR(100) NOT NULL,
  sale_price VARCHAR(100),
  original_price VARCHAR(100) NOT NULL,
  default_style BOOLEAN NOT NULL
);


-------------------
---Related Table---
-------------------
DROP TABLE IF EXISTS related CASCADE;

CREATE TABLE IF NOT EXISTS related (
  id INT UNIQUE NOT NULL PRIMARY KEY,
  current_product_id INT NOT NULL REFERENCES product(id),
  related_product_id INT NOT NULL
);


--------------------
-----Skus Table-----
--------------------
DROP TABLE IF EXISTS skus CASCADE;

CREATE TABLE IF NOT EXISTS skus (
  id INT UNIQUE NOT NULL PRIMARY KEY,
  style_id INT NOT NULL REFERENCES style(id),
  size VARCHAR(10) NOT NULL,
  quantity INT NOT NULL
);


--------------------
----Photos Table----
--------------------
DROP TABLE IF EXISTS photos CASCADE;

CREATE TABLE IF NOT EXISTS photos (
  id INT UNIQUE NOT NULL PRIMARY KEY,
  style_id INT NOT NULL REFERENCES style(id),
  url TEXT NOT NULL,
  thumbnail_url TEXT NOT NULL
);
