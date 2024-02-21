CREATE DATABASE reto_5;
USE reto_5;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tips(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);


CREATE TABLE activities(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,
    hour INT NOT NULL,
    room VARCHAR(40) NOT NULL ,
    teacher VARCHAR(40) NOT NULL ,

    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE trainings(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,
    hour INT NOT NULL,

    activities_id INT,

    FOREIGN KEY (activities_id) REFERENCES activities(id) 
);

CREATE TABLE goals(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,

    activities_id INT,

    FOREIGN KEY (activities_id) REFERENCES activities(id) 
);