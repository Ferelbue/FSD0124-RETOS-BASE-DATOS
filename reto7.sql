CREATE DATABASE reto_7;
USE reto_7;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    seller BOOLEAN,
    buyer BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    price INT NOT NULL,
    location VARCHAR(20) NOT NULL,

    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);


CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    pice INT NOT NULL,
    status ENUM('pending','in_process','done'),

    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,

    seller_id INT,
    buyer_id INT,
    
    FOREIGN KEY (seller_id) REFERENCES users(id),
    FOREIGN KEY (buyer_id) REFERENCES users(id) 
);