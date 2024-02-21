CREATE DATABASE reto_8;
USE reto_8;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE lists(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200),
    topic VARCHAR(40),

    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE movies(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200),
    topic VARCHAR(40),
    ages ENUM('under 13','all publics','aduts'),

    user_id INT,
    list_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (list_id) REFERENCES lists(id) 
);

CREATE TABLE tips(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,

    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,

    movie_id INT,

    
    FOREIGN KEY (movie_id) REFERENCES movies(id)

);