CREATE DATABASE reto_2;
USE reto_2;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fidelity_points INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE restaurants(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40) NOT NULL ,
    location VARCHAR(200),
    user_id INT,
    aforo INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);


CREATE TABLE restaurants_users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) 
);

CREATE TABLE reservations(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date INT,
    hour INT,
    people INT,
    restaurant_id INT,

    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) 
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200),
    date INT,
    restaurant_id INT,

    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) 
);