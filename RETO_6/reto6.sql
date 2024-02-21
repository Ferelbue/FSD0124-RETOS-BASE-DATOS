CREATE DATABASE reto_6;
USE reto_6;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE flights(
	id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
	company VARCHAR(40) NOT NULL ,
    destination VARCHAR(200) NOT NULL,
    capacity INT NOT NULL,
    date INT NOT NULL,
    hour INT NOT NULL
);


CREATE TABLE flights_users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,
    hour INT NOT NULL,
    room VARCHAR(40) NOT NULL ,
    teacher VARCHAR(40) NOT NULL ,

    flight_id INT,
    user_id INT,
    
    FOREIGN KEY (flight_id) REFERENCES flights(id),
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE changes(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,
    hour INT NOT NULL,

    flight_id INT,
    user_id INT,
    
    FOREIGN KEY (flight_id) REFERENCES flights(id),
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE reservations(
	id INT AUTO_INCREMENT PRIMARY KEY,
    seat VARCHAR(10) NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE seats(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,

    flight_id INT,
    reservation_id INT,
    
    FOREIGN KEY (flight_id) REFERENCES flights(id),
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) 
);

