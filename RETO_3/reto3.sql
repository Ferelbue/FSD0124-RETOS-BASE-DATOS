CREATE DATABASE reto_3;
USE reto_3;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE courses(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200),
    price INT,
    date INT NOT NULL,
    hour INT,
    student_id INT,

    FOREIGN KEY (student_id) REFERENCES students(id) 
);


CREATE TABLE leasons(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200),
    date INT NOT NULL,
    hour INT NOT NULL,
    student_id INT,
    
    FOREIGN KEY (student_id) REFERENCES students(id) 
);

CREATE TABLE tasks(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200),
    dead_line INT NOT NULL,
    student_id INT,
    
    FOREIGN KEY (student_id) REFERENCES students(id) 
);

CREATE TABLE examns(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(40) NOT NULL ,
    description VARCHAR(200) NOT NULL,
    date INT NOT NULL,
    class_room VARCHAR(40) NOT NULL,
    student_id INT,
    
    FOREIGN KEY (student_id) REFERENCES students(id) 
);
