CREATE TABLE orders (
  id VARCHAR(200) PRIMARY KEY,
  date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total NUMERIC(10,2) NOT NULL,
  customer_name VARCHAR(300) NOT NULL,
  email VARCHAR(300) NOT NULL,
  street VARCHAR(300) NOT NULL,
  postal_code VARCHAR(6) NOT NULL,
  city VARCHAR(300) NOT NULL
);

CREATE TABLE ordered_items (
  order_id VARCHAR(200), -- MySQL
  FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE, -- MySQL
  -- order_id VARCHAR(200) REFERENCES orders ON DELETE CASCADE, -- Postgresql
  model_id INT, -- MySQL
  FOREIGN KEY (model_id) REFERENCES models (id) ON UPDATE CASCADE ON DELETE RESTRICT, -- MySQL
  -- model_id INT REFERENCES models ON UPDATE CASCADE ON DELETE RESTRICT, -- Postgresql
  color_name VARCHAR(200), -- MySQL
  FOREIGN KEY (color_name) REFERENCES colors (name) ON UPDATE CASCADE ON DELETE RESTRICT, -- MySQL
  -- color_name VARCHAR(200) REFERENCES colors (name) ON UPDATE CASCADE ON DELETE RESTRICT, -- Postgresql
  size_abbr VARCHAR(10), -- MySQL
  FOREIGN KEY (size_abbr) REFERENCES sizes (abbr) ON DELETE RESTRICT, -- MySQL
  -- size_abbr VARCHAR(10) REFERENCES sizes (abbr) ON DELETE RESTRICT, -- Postgresql
  PRIMARY KEY (order_id, model_id, color_name, size_abbr),
  amount INT NOT NULL,
  title VARCHAR(300) NOT NULL,
  price NUMERIC(7,2) NOT NULL
);
