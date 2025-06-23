CREATE TABLE product (
   id SERIAL PRIMARY KEY,
   name TEXT,
   genetics TEXT,
   star BOOLEAN,
   type TEXT,
   stock TEXT,
   thc_rate TEXT,
   cbd_rate TEXT,
   price DECIMAL(10, 2),
   image TEXT,
   description TEXT,
   rating INTEGER,
   color TEXT
   image_path TEXT
);

CREATE TABLE category (
   id SERIAL PRIMARY KEY,
   name TEXT
);

CREATE TABLE reviews (
   id SERIAL PRIMARY KEY,
   message TEXT,
   rating INTEGER,
   product_id INTEGER NOT NULL,
   FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE flavor (
   id SERIAL PRIMARY KEY,
   name TEXT
);

CREATE TABLE aspect (
   id SERIAL PRIMARY KEY,
   name TEXT
);

CREATE TABLE effet (
   id SERIAL PRIMARY KEY,
   name TEXT
);

CREATE TABLE ideal_for (
   id SERIAL PRIMARY KEY,
   name TEXT
);

CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   username TEXT,
   email TEXT,
   password TEXT,
   is_admin BOOLEAN,
   verification_token TEXT,
   verification_date TEXT,
   creation_date TEXT
);

CREATE TABLE orders (
   id SERIAL PRIMARY KEY,
   numero TEXT,
   price TEXT,
   date TEXT,
   status TEXT,
   delivery_coordinate TEXT
);

CREATE TABLE faq_question (
   id SERIAL PRIMARY KEY,
   question TEXT,
   answer TEXT
);

CREATE TABLE has_flavor (
   product_id INTEGER,
   flavor_id INTEGER,
   PRIMARY KEY(product_id, flavor_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (flavor_id) REFERENCES flavor(id)
);

CREATE TABLE has_aspect (
   product_id INTEGER,
   aspect_id INTEGER,
   PRIMARY KEY(product_id, aspect_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (aspect_id) REFERENCES aspect(id)
);

CREATE TABLE has_effect (
   product_id INTEGER,
   effect_id INTEGER,
   PRIMARY KEY(product_id, effect_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (effect_id) REFERENCES effet(id)
);

CREATE TABLE is_ideal_for (
   product_id INTEGER,
   ideal_for_id INTEGER,
   PRIMARY KEY(product_id, ideal_for_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (ideal_for_id) REFERENCES ideal_for(id)
);

CREATE TABLE belongs_to (
   product_id INTEGER,
   category_id INTEGER,
   PRIMARY KEY(product_id, category_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE cart (
   product_id INTEGER,
   user_id INTEGER,
   quantity INTEGER,
   PRIMARY KEY(product_id, user_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE favorite (
   product_id INTEGER,
   user_id INTEGER,
   PRIMARY KEY(product_id, user_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE has_ordered (
   user_id INTEGER,
   order_id INTEGER,
   quantity INTEGER,
   PRIMARY KEY(user_id, order_id),
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE contains_product (
   product_id INTEGER,
   order_id INTEGER,
   quantity INTEGER,
   PRIMARY KEY(product_id, order_id),
   FOREIGN KEY (product_id) REFERENCES product(id),
   FOREIGN KEY (order_id) REFERENCES orders(id)
);


CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    user_id TEXT,
    method TEXT,
    url TEXT,
    timestamp TIMESTAMPTZ DEFAULT NOW()
);