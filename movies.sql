DROP TABLE customer;
DROP TABLE product;
DROP TABLE transactions;
DROP TABLE sale;
-- Clearing out my old stuff

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	age INTEGER
);

CREATE TABLE concessions(
	con_id SERIAL PRIMARY KEY, 
	con_name VARCHAR(100),
	con_desc VARCHAR(150),
	price FLOAT,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100),
    movie_desc VARCHAR(150),
    price FLOAT
);

CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    movie_id INTEGER NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

-- Created all of the new tables according to the ERD

-- Time to insert into the new tables

INSERT INTO customer(
    first_name,
    last_name,
    address,
    age
)VALUES(
    'Test',
    'One',
    '123 Test St',
    41
), ('Test', 'Two', '321 Test St', 14);

SELECT * FROM customer; 

INSERT INTO customer(
    first_name,
    last_name,
    address,
    age
)VALUES(
    'Test',
    'Three',
    '1 Test St',
    50
), ('Test', 'Four', '3 Test St', 5);

SELECT * FROM customer; 

INSERT INTO movies(
    movie_name,
    movie_desc,
    price
)VALUES(
    'Big Mega Scary Movie',
    'The biggest and scariest movie since Return to the Grave!!',
    7.99
), ('Taco Bell Adventure', 'Taco Bell Studios has come up with this new banger of a movie', 9.99),
('Murph and the Friend-Bot', 'Murphy will have to come to terms with losing his family, but he did not expect to find love with a robot.', 3.99);

SELECT * FROM movies;

-- Now that I think about concessions, I should have maybe put them related to the ticket? Not sure, makes more sense to have each concession item be a different thing instead of each concessions be tied to each customer.

INSERT INTO concessions(
    con_name,
    con_desc,
    price,
    customer_id
)VALUES(
    'Tacos',
    '3 Tacos from your choice of: Chicken, Beef, Pork or Bean, Cheese & Onion',
    8.99,
    1
),('Large Drink', 'Large Refillable Fountain Drink', 3.99, 1), ('2 Small Popcorn', 'Small Size Popcorn', 11.99, 1), ('Burger and Fries', 'One big burger and a load of fries', 12.99, 2), ('2 Large Drinks', 'Large Refillable Fountain Drink', 6.99, 2); 

SELECT * FROM concessions;

INSERT INTO tickets(
    customer_id,
    movie_id
)VALUES(
    1,
    1
), (1, 1), (2, 1), (2, 2), (2, 3), (3, 1), (4, 3);

SELECT * FROM tickets;