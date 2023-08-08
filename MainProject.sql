CREATE DATABASE MainProject;
USE MainProject;

/*Creating Table*/
CREATE TABLE Ministries (
ministry_ID INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);

CREATE TABLE Facilities (
facility_ID INT PRIMARY KEY AUTO_INCREMENT,
ministry_ID INT,
name VARCHAR(50),
address VARCHAR(50), 
city VARCHAR(50),
phone VARCHAR(50),
postalCode VARCHAR(50),
province VARCHAR(50),
capacity INT,
webAddress VARCHAR(50),
facilityType VARCHAR(50), 
subType VARCHAR(50),
FOREIGN KEY (ministry_ID) REFERENCES Ministries(ministry_ID)
);

CREATE TABLE Citizens (
medicareNumber INT PRIMARY KEY,
expiryDate DATE,
firstName VARCHAR(50),
lastName VARCHAR(50),
birthDate DATE,
citizenship VARCHAR(50),
email VARCHAR(50),
province VARCHAR(50),
phone VARCHAR(50),
city VARCHAR(50),
zip VARCHAR(50), 
address VARCHAR(50) 
);

CREATE TABLE Vaccines (
    vaccineID INT PRIMARY KEY,
    type VARCHAR(50)
);

CREATE TABLE Infections (
    infectionID INT PRIMARY KEY,
    type VARCHAR(50)
);

CREATE TABLE InfectedBy ( 
    infectionInstanceID INT PRIMARY KEY AUTO_INCREMENT,
    medicareNumber INT,
    infectionID INT,
    dateInfected DATE,
    FOREIGN KEY (medicareNumber) REFERENCES Citizens(medicareNumber),
    FOREIGN KEY (infectionID) REFERENCES Infections(infectionID)
);


CREATE TABLE Students (
    medicareNumber INT PRIMARY KEY,
    studentID INT UNIQUE,
    facility_ID INT,
    grade VARCHAR(255),
    FOREIGN KEY (facility_ID) REFERENCES Facilities(facility_ID),
    FOREIGN KEY (medicareNumber) REFERENCES Citizens(medicareNumber)
);

Create Table Employees (
medicareNumber INT PRIMARY KEY,
employee_ID INT UNIQUE,
role VARCHAR(250),
specialization VARCHAR(250),
additionalRole VARCHAR(250),
FOREIGN KEY (medicareNumber) REFERENCES Citizens(medicareNumber)
);

CREATE TABLE EmployeeSchedule (
schedule_ID INT PRIMARY KEY AUTO_INCREMENT,
employee_ID INT,
facility_ID INT,
task VARCHAR(250),
startTime DATETIME,
endTime DATETIME,
FOREIGN KEY (facility_ID) REFERENCES Facilities(facility_ID),
FOREIGN KEY (employee_ID) REFERENCES Employees(employee_ID)
);

CREATE TABLE LogEmail (
email_ID INT PRIMARY KEY AUTO_INCREMENT,
date DATE,
facility_ID INT,
employee_ID INT,
subject VARCHAR(80),
body VARCHAR(80),
FOREIGN KEY (facility_ID) REFERENCES Facilities(facility_ID),
FOREIGN KEY (employee_ID) REFERENCES Employees(employee_ID)
);

Create Table TookVaccine ( 
vaccineInstanceID INT PRIMARY KEY AUTO_INCREMENT,
doseNumber INT,
vaccineID INT, 
vaccinationDate DATE, 
medicareNumber INT,
FOREIGN KEY (medicareNumber) REFERENCES Citizens(medicareNumber),
FOREIGN KEY (vaccineID) REFERENCES Vaccines(vaccineID)
);

/*Atler tables(When modifications are needed*/
/*
DROP TABLE Employees;
DROP TABLE Students;
DROP TABLE Facilities;
DROP TABLE InfectedBy;
DROP TABLE TookVaccine;
DROP TABLE Vaccines;
DROP TABLE Infections;
DROP TABLE Citizens;
DROP TABLE Ministries;
*/
/*Inserting rows*/
INSERT INTO Ministries(name) 
VALUES 
    ('Ministry of Education'),
	('Ministry of Health'),
	('Ministry of Social Services'),
	('Ministry of Finance'),
	('Ministry of Transportation'),
	('Ministry of Environment'),
	('Ministry of Agriculture'),
	('Ministry of Energy'),
	('Ministry of Tourism'),
	('Ministry of Culture');

INSERT INTO Facilities (ministry_ID, name, address, city, phone, postalCode, province, capacity, webAddress, facilityType, subType)
VALUES 
     /**/
	(1, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(1, 'Rosemont', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(1, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(2, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(2, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(2, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(3, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(3, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(3, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
        
	(4, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(4, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(4, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(5, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(5, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(5, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(6, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(6, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(6, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(7, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(7, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(7, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(8, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(8, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(8, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(9, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(9, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(9, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
	(10, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(10, 'Pointe Olivier', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary'),
	(10, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'secondary'),
    
    /*For query 4 warmup*/
    (2, 'Rosemont Elementary School', '123 Maple St.', 'Laval', '514-111-1111', 'H2X 3Y4', 'Quebec', 500, 'www.rosemontschool.com', 'Education', 'Elementary School'),
    (2, 'Laval Secondary School', '456 Oak Ave.', 'Laval', '514-222-2222', 'H3Y 2Z5', 'Quebec', 800, 'www.lavalsecondary.com', 'Education', 'Secondary School'),
    (2, 'Laval Middle School', '789 Elm Dr.', 'Laval', '514-333-3333', 'H4Z 1A2', 'Quebec', 600, 'www.lavalmiddleschool.com', 'Education', 'Middle School');

INSERT INTO Citizens (medicareNumber, expiryDate, firstName, lastName, birthDate, citizenship, email, province, phone, city, zip, address)
VALUES 
/*Students*/
(1, '2024-08-31', 'John', 'Doe', '1990-05-15', 'USA', 'john.doe@email.com', 'California', '555-123-4567', 'Los Angeles', '90001', '123 Main St'),
(2, '2023-12-31', 'Jane', 'Smith', '1985-10-22', 'USA', 'jane.smith@email.com', 'New York', '555-987-6543', 'New York City', '10001', '456 Elm St'),
(3, '2025-06-30', 'Michael', 'Johnson', '1992-03-08', 'USA', 'michael.johnson@email.com', 'Texas', '555-555-5555', 'Houston', '77001', '789 Oak St'),
(4, '2023-11-30', 'Emily', 'Williams', '1988-12-01', 'USA', 'emily.williams@email.com', 'Florida', '555-111-2222', 'Miami', '33101', '101 Palm Ave'),
(5, '2024-09-30', 'Christopher', 'Jones', '1996-07-12', 'USA', 'chris.jones@email.com', 'Illinois', '555-444-3333', 'Chicago', '60601', '222 Maple St'),
(6, '2022-10-31', 'Olivia', 'Brown', '1999-09-25', 'USA', 'olivia.brown@email.com', 'Arizona', '555-666-7777', 'Phoenix', '85001', '333 Pine St'),
(7, '2023-03-31', 'William', 'Davis', '1980-11-18', 'USA', 'william.davis@email.com', 'California', '555-222-8888', 'San Francisco', '94101', '444 Cedar St'),
(8, '2025-04-30', 'Ava', 'Miller', '1982-02-05', 'USA', 'ava.miller@email.com', 'Texas', '555-999-1111', 'Dallas', '75201', '555 Birch St'),
(9, '2024-07-31', 'James', 'Garcia', '1991-06-30', 'USA', 'james.garcia@email.com', 'Florida', '555-777-3333', 'Tampa', '33601', '666 Willow St'),
(10, '2023-10-31', 'Isabella', 'Rodriguez', '1987-04-09', 'USA', 'isabella.rodriguez@email.com', 'New York', '555-333-6666', 'Buffalo', '14201', '777 Elm St'),
(11, '2024-11-30', 'Alexander', 'Martinez', '1997-08-14', 'USA', 'alex.martinez@email.com', 'California', '555-666-1111', 'San Diego', '92101', '888 Oak St'),
(12, '2023-09-30', 'Sophia', 'Hernandez', '1984-01-29', 'USA', 'sophia.hernandez@email.com', 'Texas', '555-888-4444', 'Austin', '73301', '999 Maple St'),
(13, '2025-05-31', 'Daniel', 'Lopez', '1989-03-23', 'USA', 'daniel.lopez@email.com', 'Florida', '555-222-9999', 'Miami', '33101', '111 Palm Ave'),
(14, '2024-08-31', 'Mia', 'Gonzalez', '1993-11-07', 'USA', 'mia.gonzalez@email.com', 'Illinois', '555-555-7777', 'Chicago', '60601', '222 Pine St'),
(15, '2023-12-31', 'Matthew', 'Nelson', '1981-12-19', 'USA', 'matthew.nelson@email.com', 'Arizona', '555-999-5555', 'Phoenix', '85001', '333 Oak St'),
(16, '2025-06-30', 'Emma', 'Carter', '1986-07-26', 'USA', 'emma.carter@email.com', 'California', '555-111-7777', 'San Francisco', '94101', '444 Maple St'),
(17, '2023-11-30', 'Joseph', 'Hill', '1995-05-04', 'USA', 'joseph.hill@email.com', 'Texas', '555-444-2222', 'Dallas', '75201', '555 Cedar St'),
(18, '2024-09-30', 'Madison', 'Mitchell', '1998-10-31', 'USA', 'madison.mitchell@email.com', 'Florida', '555-777-8888', 'Tampa', '33601', '666 Birch St'),
(19, '2022-10-31', 'Oliver', 'Perez', '1983-09-12', 'USA', 'oliver.perez@email.com', 'New York', '555-666-3333', 'Buffalo', '14201', '777 Willow St'),
(20, '2023-03-31', 'Ava', 'Roberts', '1990-02-28', 'USA', 'ava.roberts@email.com', 'California', '555-222-9999', 'San Diego', '92101', '888 Pine St'),
(21, '2020-04-30', 'Scarlett', 'Turner', '1987-01-05', 'USA', 'scarlett.turner@email.com', 'Texas', '555-888-7777', 'Austin', '73301', '999 Oak St'),
(22, '2020-07-31', 'Aiden', 'Phillips', '1991-10-20', 'USA', 'aiden.phillips@email.com', 'Florida', '555-111-4444', 'Miami', '33101', '111 Maple Ave'),
(23, '2023-10-31', 'Aria', 'Ross', '1984-03-16', 'USA', 'aria.ross@email.com', 'Illinois', '555-333-7777', 'Chicago', '60601', '222 Cedar Ave'),
(24, '2024-11-30', 'Henry', 'Sanchez', '1992-07-01', 'USA', 'henry.sanchez@email.com', 'Arizona', '555-666-5555', 'Phoenix', '85001', '333 Birch Ave'),
(25, '2023-09-30', 'Ella', 'Butler', '1989-04-03', 'USA', 'ella.butler@email.com', 'California', '555-999-2222', 'San Francisco', '94101', '444 Oak Ave'),
(26, '2025-05-31', 'Andrew', 'Barnes', '1981-06-29', 'USA', 'andrew.barnes@email.com', 'Texas', '555-222-7777', 'Dallas', '75201', '555 Pine Ave'),
(27, '2024-08-31', 'Grace', 'Fisher', '1994-12-13', 'USA', 'grace.fisher@email.com', 'Florida', '555-555-4444', 'Tampa', '33601', '666 Cedar Ave'),
(28, '2023-12-31', 'Alexander', 'Henderson', '1997-01-30', 'USA', 'alex.henderson@email.com', 'New York', '555-777-6666', 'Buffalo', '14201', '777 Willow Ave'),
(29, '2025-06-30', 'Luna', 'Coleman', '1982-08-25', 'USA', 'luna.coleman@email.com', 'California', '555-444-3333', 'San Diego', '92101', '888 Birch Ave'),
(30, '2023-11-30', 'Benjamin', 'Simmons', '1996-03-14', 'USA', 'benjamin.simmons@email.com', 'Texas', '555-111-8888', 'Austin', '73301', '999 Pine Ave'),
(31, '2024-09-30', 'Nora', 'Washington', '1987-05-22', 'USA', 'nora.washington@email.com', 'Florida', '555-777-3333', 'Miami', '33101', '111 Maple St'),
(32, '2022-10-31', 'Carter', 'Sanders', '1999-09-08', 'USA', 'carter.sanders@email.com', 'Illinois', '555-666-7777', 'Chicago', '60601', '222 Cedar St'),
(33, '2023-03-31', 'Chloe', 'Perry', '1980-04-05', 'USA', 'chloe.perry@email.com', 'Arizona', '555-222-8888', 'Phoenix', '85001', '333 Birch St'),
(34, '2025-04-30', 'Matthew', 'Butler', '1984-06-12', 'USA', 'matthew.butler@email.com', 'California', '555-999-1111', 'San Francisco', '94101', '444 Elm St'),
(35, '2024-07-31', 'Eleanor', 'Rivera', '1991-08-31', 'USA', 'eleanor.rivera@email.com', 'Texas', '555-111-2222', 'Dallas', '75201', '555 Maple St'),
(36, '2023-10-31', 'Gabriel', 'Reyes', '1995-11-24', 'USA', 'gabriel.reyes@email.com', 'Florida', '555-333-6666', 'Tampa', '33601', '666 Pine St'),
(37, '2024-11-30', 'Violet', 'Brooks', '1998-01-14', 'USA', 'violet.brooks@email.com', 'New York', '555-666-1111', 'Buffalo', '14201', '777 Cedar St'),
(38, '2023-09-30', 'Julian', 'Long', '1983-02-18', 'USA', 'julian.long@email.com', 'California', '555-888-4444', 'San Diego', '92101', '888 Elm St'),
(39, '2025-05-31', 'Penelope', 'Baker', '1989-03-07', 'USA', 'penelope.baker@email.com', 'Texas', '555-222-9999', 'Austin', '73301', '999 Pine St'),
(40, '2024-08-31', 'Leo', 'Evans', '1992-12-02', 'USA', 'leo.evans@email.com', 'Florida', '555-555-7777', 'Miami', '33101', '111 Birch St'),
(41, '2023-12-31', 'Layla', 'Bell', '1993-07-10', 'USA', 'layla.bell@email.com', 'Illinois', '555-777-8888', 'Chicago', '60601', '222 Oak St'),
(42, '2025-06-30', 'Thomas', 'Gomez', '1981-09-26', 'USA', 'thomas.gomez@email.com', 'Arizona', '555-444-3333', 'Phoenix', '85001', '333 Cedar St'),
(43, '2023-11-30', 'Grace', 'Ward', '1996-03-16', 'USA', 'grace.ward@email.com', 'California', '555-111-7777', 'San Francisco', '94101', '444 Elm St'),
(44, '2024-09-30', 'Stella', 'Murphy', '1987-04-19', 'USA', 'stella.murphy@email.com', 'Texas', '555-444-2222', 'Dallas', '75201', '555 Maple St'),
(45, '2022-10-31', 'Riley', 'Torres', '1990-10-25', 'USA', 'riley.torres@email.com', 'Florida', '555-666-3333', 'Tampa', '33601', '666 Cedar St'),
(46, '2023-03-31', 'Hudson', 'Peterson', '1984-03-22', 'USA', 'hudson.peterson@email.com', 'New York', '555-222-9999', 'Buffalo', '14201', '777 Birch St'),
(47, '2025-04-30', 'Nora', 'Foster', '1986-07-07', 'USA', 'nora.foster@email.com', 'California', '555-999-5555', 'San Diego', '92101', '888 Elm St'),
(48, '2024-07-31', 'Levi', 'Bryant', '1991-08-10', 'USA', 'levi.bryant@email.com', 'Texas', '555-111-4444', 'Austin', '73301', '999 Oak St'),
(49, '2023-10-31', 'Lydia', 'Alexander', '1995-05-11', 'USA', 'lydia.alexander@email.com', 'Florida', '555-333-7777', 'Miami', '33101', '111 Cedar St'),
(50, '2024-11-30', 'Elliot', 'Russell', '1998-11-28', 'USA', 'elliot.russell@email.com', 'Illinois', '555-666-5555', 'Chicago', '60601', '222 Elm St'),

/*Employees*/
(51, '2024-08-31', 'Lucas', 'Cooper', '1990-05-15', 'USA', 'lucas.cooper@email.com', 'California', '555-123-4567', 'Los Angeles', '90001', '123 Main St'),
(52, '2023-12-31', 'Harper', 'Ward', '1985-10-22', 'USA', 'harper.ward@email.com', 'New York', '555-987-6543', 'New York City', '10001', '456 Elm St'),
(53, '2025-06-30', 'Ethan', 'Gomez', '1992-03-08', 'USA', 'ethan.gomez@email.com', 'Texas', '555-555-5555', 'Houston', '77001', '789 Oak St'),
(54, '2023-11-30', 'Abigail', 'Mitchell', '1988-12-01', 'USA', 'abigail.mitchell@email.com', 'Florida', '555-111-2222', 'Miami', '33101', '101 Palm Ave'),
(55, '2024-09-30', 'Evelyn', 'Foster', '1996-07-12', 'USA', 'evelyn.foster@email.com', 'Illinois', '555-444-3333', 'Chicago', '60601', '222 Maple St'),
(56, '2022-10-31', 'Samuel', 'Bell', '1999-09-25', 'USA', 'samuel.bell@email.com', 'Arizona', '555-666-7777', 'Phoenix', '85001', '333 Pine St'),
(57, '2023-03-31', 'Avery', 'Peterson', '1980-11-18', 'USA', 'avery.peterson@email.com', 'California', '555-222-8888', 'San Francisco', '94101', '444 Cedar St'),
(58, '2025-04-30', 'Scarlett', 'Phillips', '1982-02-05', 'USA', 'scarlett.phillips@email.com', 'Texas', '555-999-1111', 'Dallas', '75201', '555 Birch St'),
(59, '2024-07-31', 'Jackson', 'Hernandez', '1991-06-30', 'USA', 'jackson.hernandez@email.com', 'Florida', '555-777-3333', 'Tampa', '33601', '666 Willow St'),
(60, '2023-10-31', 'Victoria', 'Russell', '1987-04-09', 'USA', 'victoria.russell@email.com', 'New York', '555-333-6666', 'Buffalo', '14201', '777 Elm St'),
(61, '2024-11-30', 'Leo', 'Howard', '1997-08-14', 'USA', 'leo.howard@email.com', 'California', '555-666-1111', 'San Diego', '92101', '888 Oak St'),
(62, '2023-09-30', 'Grace', 'Turner', '1984-01-29', 'USA', 'grace.turner@email.com', 'Texas', '555-888-4444', 'Austin', '73301', '999 Maple St'),
(63, '2025-05-31', 'Elijah', 'Lopez', '1989-03-23', 'USA', 'elijah.lopez@email.com', 'Florida', '555-222-9999', 'Miami', '33101', '111 Palm Ave'),
(64, '2024-08-31', 'Hannah', 'Gonzalez', '1993-11-07', 'USA', 'hannah.gonzalez@email.com', 'Illinois', '555-555-7777', 'Chicago', '60601', '222 Pine St'),
(65, '2023-12-31', 'Christopher', 'Nelson', '1981-12-19', 'USA', 'christopher.nelson@email.com', 'Arizona', '555-999-5555', 'Phoenix', '85001', '333 Oak St'),
(66, '2025-06-30', 'Leah', 'Carter', '1986-07-26', 'USA', 'leah.carter@email.com', 'California', '555-111-7777', 'San Francisco', '94101', '444 Maple St'),
(67, '2023-11-30', 'Isaac', 'Hill', '1995-05-04', 'USA', 'isaac.hill@email.com', 'Texas', '555-444-2222', 'Dallas', '75201', '555 Cedar St'),
(68, '2024-09-30', 'Elizabeth', 'Mitchell', '1998-10-31', 'USA', 'elizabeth.mitchell@email.com', 'Florida', '555-777-8888', 'Tampa', '33601', '666 Birch St'),
(69, '2022-10-31', 'Daniel', 'Perez', '1983-09-12', 'USA', 'daniel.perez@email.com', 'New York', '555-666-3333', 'Buffalo', '14201', '777 Willow St'),
(70, '2023-03-31', 'Eleanor', 'Roberts', '1990-02-28', 'USA', 'eleanor.roberts@email.com', 'California', '555-222-9999', 'San Diego', '92101', '888 Pine St'),
(71, '2025-04-30', 'Thomas', 'Turner', '1987-01-05', 'USA', 'thomas.turner@email.com', 'Texas', '555-888-7777', 'Austin', '73301', '999 Oak St'),
(72, '2024-07-31', 'Matthew', 'Phillips', '1991-10-20', 'USA', 'matthew.phillips@email.com', 'Florida', '555-111-4444', 'Miami', '33101', '111 Maple Ave'),
(73, '2023-10-31', 'Aria', 'Ross', '1984-03-16', 'USA', 'aria.ross@email.com', 'Illinois', '555-333-7777', 'Chicago', '60601', '222 Cedar Ave'),
(74, '2024-11-30', 'Liam', 'Sanchez', '1992-07-01', 'USA', 'liam.sanchez@email.com', 'Arizona', '555-666-5555', 'Phoenix', '85001', '333 Birch Ave'),
(75, '2023-09-30', 'Lily', 'Butler', '1989-04-03', 'USA', 'lily.butler@email.com', 'California', '555-999-2222', 'San Francisco', '94101', '444 Oak Ave'),
(76, '2025-05-31', 'Benjamin', 'Barnes', '1981-06-29', 'USA', 'benjamin.barnes@email.com', 'Texas', '555-222-7777', 'Dallas', '75201', '555 Pine Ave'),
(77, '2024-08-31', 'Aria', 'Fisher', '1994-12-13', 'USA', 'aria.fisher@email.com', 'Florida', '555-555-4444', 'Tampa', '33601', '666 Cedar Ave'),
(78, '2023-12-31', 'Mason', 'Henderson', '1997-01-30', 'USA', 'mason.henderson@email.com', 'New York', '555-777-6666', 'Buffalo', '14201', '777 Willow Ave'),
(79, '2025-06-30', 'Ella', 'Coleman', '1982-08-25', 'USA', 'ella.coleman@email.com', 'California', '555-444-3333', 'San Diego', '92101', '888 Birch Ave'),
(80, '2023-11-30', 'James', 'Simmons', '1996-03-14', 'USA', 'james.simmons@email.com', 'Texas', '555-111-8888', 'Austin', '73301', '999 Pine Ave'),
(81, '2024-09-30', 'Skylar', 'Washington', '1987-05-22', 'USA', 'skylar.washington@email.com', 'Florida', '555-777-3333', 'Miami', '33101', '111 Maple St'),
(82, '2022-10-31', 'Bella', 'Sanders', '1999-09-08', 'USA', 'bella.sanders@email.com', 'Illinois', '555-666-7777', 'Chicago', '60601', '222 Cedar St'),
(83, '2023-03-31', 'Jackson', 'Perry', '1980-04-05', 'USA', 'jackson.perry@email.com', 'Arizona', '555-222-8888', 'Phoenix', '85001', '333 Birch St'),
(84, '2025-04-30', 'Paisley', 'Butler', '1984-06-12', 'USA', 'paisley.butler@email.com', 'California', '555-999-1111', 'San Francisco', '94101', '444 Elm St'),
(85, '2024-07-31', 'Camila', 'Rivera', '1991-08-31', 'USA', 'camila.rivera@email.com', 'Texas', '555-111-2222', 'Dallas', '75201', '555 Maple St'),
(86, '2023-10-31', 'Lucas', 'Reyes', '1995-11-24', 'USA', 'lucas.reyes@email.com', 'Florida', '555-333-6666', 'Tampa', '33601', '666 Pine St'),
(87, '2024-11-30', 'Mateo', 'Brooks', '1998-01-14', 'USA', 'mateo.brooks@email.com', 'New York', '555-666-1111', 'Buffalo', '14201', '777 Cedar St'),
(88, '2023-09-30', 'Nora', 'Long', '1983-02-18', 'USA', 'nora.long@email.com', 'California', '555-888-4444', 'San Diego', '92101', '888 Elm St'),
(89, '2025-05-31', 'Ellie', 'Baker', '1989-03-07', 'USA', 'ellie.baker@email.com', 'Texas', '555-222-9999', 'Austin', '73301', '999 Pine St'),
(90, '2024-08-31', 'Grayson', 'Evans', '1992-12-02', 'USA', 'grayson.evans@email.com', 'Florida', '555-555-7777', 'Miami', '33101', '111 Birch St'),
(91, '2023-12-31', 'Ruby', 'Bell', '1993-07-10', 'USA', 'ruby.bell@email.com', 'Illinois', '555-777-8888', 'Chicago', '60601', '222 Oak St'),
(92, '2025-06-30', 'Luke', 'Gomez', '1981-09-26', 'USA', 'luke.gomez@email.com', 'Arizona', '555-444-3333', 'Phoenix', '85001', '333 Cedar St'),
(93, '2023-11-30', 'Layla', 'Ward', '1996-03-16', 'USA', 'layla.ward@email.com', 'California', '555-111-7777', 'San Francisco', '94101', '444 Elm St'),
(94, '2024-09-30', 'William', 'Mitchell', '1987-04-19', 'USA', 'william.mitchell@email.com', 'Texas', '555-444-2222', 'Dallas', '75201', '555 Maple St'),
(95, '2022-10-31', 'Anna', 'Torres', '1990-10-25', 'USA', 'anna.torres@email.com', 'Florida', '555-666-3333', 'Tampa', '33601', '666 Cedar St'),
(96, '2023-03-31', 'Hudson', 'Peterson', '1984-03-22', 'USA', 'hudson.peterson@email.com', 'New York', '555-222-9999', 'Buffalo', '14201', '777 Birch St'),
(97, '2025-04-30', 'Natalie', 'Foster', '1986-07-07', 'USA', 'natalie.foster@email.com', 'California', '555-999-5555', 'San Diego', '92101', '888 Elm St'),
(98, '2024-07-31', 'Sebastian', 'Bryant', '1991-08-10', 'USA', 'sebastian.bryant@email.com', 'Texas', '555-111-4444', 'Austin', '73301', '999 Oak St'),
(99, '2023-10-31', 'Maya', 'Alexander', '1995-05-11', 'USA', 'maya.alexander@email.com', 'Florida', '555-333-7777', 'Miami', '33101', '111 Cedar St'),
(100, '2024-11-30', 'Grayson', 'Russell', '1998-11-28', 'USA', 'grayson.russell@email.com', 'Illinois', '555-666-5555', 'Chicago', '60601', '222 Elm St');


UPDATE MainProject.Citizens SET medicareNumber = medicare_number, 
                        expiryDate = expiry_date, firstName = first_name, lastName = last_name,
                        birthDate = :irth_date, citizenship = :citizenship, email = :email, 
                        province = :province, phone = :phone,city = :city, zip = :zip, address = :address);
                        
DELETE FROM MainProject.Citizens  WHERE Citizens.medicareNumber = 238523423;
INSERT INTO Students (medicareNumber, studentID, facility_ID, grade) 
VALUES 
      /*Ministry 1*/
	(1, 1, 2, 'Grade 1'),
	(2, 2, 3, 'Grade 2'),
    /*Ministry 2*/
	(3, 3, 5, 'Grade 3'),
	(4, 4, 6, 'Grade 4'),
    /*Ministry 3*/
    (5, 5, 8, 'Grade 4'),
    (6, 6, 9, 'Grade 9'),
    /*Ministry 4*/
    (7, 7, 11, 'Grade 4'),
	(8, 8, 12, 'Grade 4'),
    /*Ministry 5*/
	(9, 9, 14, 'Grade 4'),
	(10, 10, 15, 'Grade 4'),
    /*Ministry 6*/
	(11, 11, 17, 'Grade 4'),
	(12, 12, 18, 'Grade 4'),
    /*Ministry 7*/
	(13, 13, 20, 'Grade 4'),
	(14, 14, 21, 'Grade 4'),
    /*Ministry 8*/
	(15, 15, 23, 'Grade 4'),
    (16, 16, 24, 'Grade 4'),
    /*Ministry 9*/
    (17, 17, 26, 'Grade 4'),
    (18, 18, 27, 'Grade 4'),
    /*Ministry 10*/
    (19, 19, 29, 'Grade 4'),
    (20, 20, 30, 'Grade 4'),
    
    /**query 3, rosemont elementary school*/
	/*Ministry 1*/
	(21, 21, 2, 'Grade 1'),
	(22, 22, 2, 'Grade 2'),
    
    /*Query 4 student goes to laval*/
    (23, 23, 31, 'Grade 5'),
    (24, 24, 32, 'Grade 9'),
    (25, 25, 33, 'Grade 7');
    
INSERT INTO Employees (medicareNumber, employee_ID, role, specialization, additionalRole)
VALUES 
/*President of head office (minister)*/
(51, 1, 'President', NULL, 'Additional Role 1'), -- QUERY 10
(52, 2, 'President', NULL, 'Additional Role 2'),
(53, 3, 'President', NULL, 'Additional Role 3'),
(54, 4, 'President', NULL, 'Additional Role 4'),
(55, 5, 'President', NULL, 'Additional Role 5'),
(56, 6, 'President', NULL, 'Additional Role 6'),
(57, 7, 'President', NULL, 'Additional Role 7'),
(58, 8, 'President', NULL, 'Additional Role 8'),
(59, 9, 'President', NULL, 'Additional Role 9'),
(60, 10, 'President', NULL, 'Additional Role 10'),

/*Principals of education facility*/
(61, 11, 'Principal', NULL, 'Additional Role 11'),
(62, 12, 'Principal', NULL, 'Additional Role 12'),
(63, 13, 'Principal', NULL, 'Additional Role 13'),
(64, 14, 'Principal', NULL, 'Additional Role 14'),
(65, 15, 'Principal', NULL, 'Additional Role 15'),
(66, 16, 'Principal', NULL, 'Additional Role 16'),
(67, 17, 'Principal', NULL, 'Additional Role 17'),
(68, 18, 'Principal', NULL, 'Additional Role 18'),
(69, 19, 'Principal', NULL, 'Additional Role 19'),
(70, 20, 'Principal', NULL, 'Additional Role 20'),

/*Teachers*/
(71, 21, 'Teacher', 'Math', 'Additional Role 21'), 
(72, 22, 'Teacher', 'French', 'Additional Role 22'),
(73, 23, 'Teacher', 'Science', 'Additional Role 23'),
(74, 24, 'Teacher', 'English', 'Additional Role 24'),
(75, 25, 'Teacher', 'History', 'Additional Role 25'),
(76, 26, 'Teacher', 'Music', 'Additional Role 26'),
(77, 27, 'Teacher', 'Art', 'Additional Role 27'),
(78, 28, 'Teacher', 'Physical Education', 'Additional Role 28'),
(79, 29, 'Teacher', 'Biology', 'Additional Role 29'),
(80, 30, 'Teacher', 'Chemistry', 'Additional Role 30'),

/*More Teachers*/
(81, 31, 'Teacher', 'Physics', 'Additional Role 31'),
(82, 32, 'Teacher', 'Computer Science', 'Additional Role 32'),
(83, 33, 'Teacher', 'Geography', 'Additional Role 33'),
(84, 34, 'Teacher', 'Economics', 'Additional Role 34'),
(85, 35, 'Teacher', 'Psychology', 'Additional Role 35'),
(86, 36, 'Teacher', 'Sociology', 'Additional Role 36'),
(87, 37, 'Teacher', 'Physical Education', 'Additional Role 37'),
(88, 38, 'Teacher', 'English', 'Additional Role 38'),
(89, 39, 'Teacher', 'Math', 'Additional Role 39'),
(90, 40, 'Teacher', 'French', 'Additional Role 40'),

/*More Teachers*/
(91, 41, 'Teacher', 'Science', 'Additional Role 41'),
(92, 42, 'Teacher', 'Music', 'Additional Role 42'),
(93, 43, 'Teacher', 'Art', 'Additional Role 43'),
(94, 44, 'Teacher', 'Physical Education', 'Additional Role 44'),
(95, 45, 'Teacher', 'Biology', 'Additional Role 45'),
(96, 46, 'Teacher', 'Chemistry', 'Additional Role 46'),
(97, 47, 'Teacher', 'Physics', 'Additional Role 47'),
(98, 48, 'Teacher', 'Computer Science', 'Additional Role 48'),
(99, 49, 'Teacher', 'Geography', 'Additional Role 49'),
(100, 50, 'Teacher', 'Economics', 'Additional Role 50');

/***/

INSERT INTO Infections (infectionID, type)
VALUES 
(1, 'COVID-19'),
(2, 'SARS-Cov-2 Variant'),
(3, 'Influenza'),
(4, 'MERS-CoV'),
(5, 'Ebola'),
(6, 'Zika'),
(7, 'H1N1'),
(8, 'Cholera'),
(9, 'Measles'),
(10, 'Hepatitis B');

INSERT INTO InfectedBy (medicareNumber, infectionID, dateInfected)
VALUES /*
(1, 1, '2023-07-01'),
(3, 1, '2023-07-02'),
(5, 1, '2023-07-03'),
(7, 1, '2023-07-04'),
(9, 1, '2023-07-05'),
(21, 1, '2023-07-05'),
(22, 1, '2023-07-05'),
(23, 1, '2023-07-21'),
(23, 1, '2023-07-20'),
(23, 1, '2023-07-19'),
(24, 2, '2023-07-15'), 
(24, 2, '2023-07-13'), 
(24, 2, '2023-07-11'),
(25, 1, '2023-07-17'), 
(25, 1, '2023-07-19'),
(25, 1, '2023-07-18'),

(81, 1, '2023-07-06'),
(83, 1, '2023-07-07'),
(85, 1, '2023-07-08'),
(87, 1, '2023-07-09'),*/
(89, 1, '2023-07-31'),
(89, 1, '2023-07-30');    
INSERT INTO Vaccines (vaccineID, type)
VALUES 
(1, 'Pfizer'),
(2, 'Moderna'),
(3, 'AstraZeneca'),
(4, 'Johnson & Johnson'),
(5, 'Sinovac'),
(6, 'Novavax'),
(7, 'Covaxin'),
(8, 'Sputnik V'),
(9, 'Sinopharm'),
(10, 'CanSinoBIO'),
(11, 'Bharat Biotech'),
(12, 'Pfizer-BioNTech'),
(13, 'Janssen');

INSERT INTO TookVaccine (doseNumber, vaccineID, vaccinationDate, medicareNumber)
VALUES 
(1, 1, '2023-07-01', 2),
(2, 1, '2023-07-02', 4),
(3, 2, '2023-07-03', 6),
(1, 2, '2023-07-04', 8),
(2, 1, '2023-07-05', 10),
(3, 2, '2023-07-06', 82),
(1, 1, '2023-07-07', 84),
(2, 2, '2023-07-08', 86),
(1, 2, '2023-07-09', 88),
(3, 1, '2023-07-10', 90);

INSERT INTO EmployeeSchedule (employee_ID, facility_ID, task, startTime, endTime)
VALUES 
/*query 10*/
(1, 1, 'Presides', '2023-07-30 08:00:00', '2023-07-30 17:00:00'),
(1, 1, 'Presides', '2023-07-31 08:00:00', '2023-07-31 17:00:00');

INSERT INTO LogEmail (date, facility_ID, employee_ID, subject, body)
VALUES 
('2023-07-30', 1, 1, 'Schedule', 'Dear Employee, Just a quick update on the ongoing project.'),
('2023-07-31', 4, 2, 'Schedule', 'Dear Employee, Just a quick update on the ongoing project.');

/*Queries*/
/*Q1*/
/*get the province name where the ministry is located and the name of the minister of education for each ministry*/
SELECT m.ministry_ID, m.name, f.province, CONCAT(c.firstName, ' ', c.lastName) AS 'Minister of Education'
FROM Ministries m
JOIN Facilities f ON m.ministry_ID = f.ministry_ID
JOIN Employees e ON e.facility_ID = f.facility_ID
JOIN Citizens c ON c.medicareNumber = e.medicareNumber
WHERE 
	f.facilityType = 'Management' AND f.subType = 'Head office'
    AND e.role = 'President';

/*the number of facilities within the ministry*/    
SELECT m.ministry_ID, m.name, COUNT(*) AS 'Number of facilities'
FROM Facilities f
JOIN Ministries m ON m.ministry_ID = f.ministry_ID
GROUP BY ministry_ID;

/*the total number of employees currently working for all the facilities in the ministry*/
SELECT m.ministry_ID, m.name, COUNT(*) AS 'Number of employees'
FROM Employees e
JOIN Facilities f ON e.facility_ID = f.facility_ID
JOIN Ministries m ON f.ministry_ID = m.ministry_ID
GROUP BY m.ministry_ID;

/*the total number of students currently registered in the schools within the ministry*/
SELECT m.ministry_ID, m.name, COUNT(*) AS 'Number of students'
FROM Students s
JOIN Facilities f ON s.facility_ID = f.facility_ID
JOIN Ministries m ON f.ministry_ID = m.ministry_ID  
GROUP BY m.ministry_ID;

/*Q1 all queries in one*/
SELECT 
    m.ministry_ID, 
    m.name, 
    f.province, 
    CONCAT(c.firstName, ' ', c.lastName) AS 'Minister of Education',
    (SELECT COUNT(*) FROM Facilities f2 WHERE f2.ministry_ID = m.ministry_ID) AS 'Number of facilities',
    (SELECT COUNT(*) FROM Employees e2 
     JOIN Facilities f2 ON e2.facility_ID = f2.facility_ID 
     WHERE f2.ministry_ID = m.ministry_ID) AS 'Number of employees',
    (SELECT COUNT(*) FROM Students s2 
     JOIN Facilities f2 ON s2.facility_ID = f2.facility_ID 
     WHERE f2.ministry_ID = m.ministry_ID) AS 'Number of students'
FROM 
    Ministries m
    JOIN Facilities f ON m.ministry_ID = f.ministry_ID
    JOIN Employees e ON e.facility_ID = f.facility_ID
    JOIN Citizens c ON c.medicareNumber = e.medicareNumber
WHERE 
	f.facilityType = 'Management' AND f.subType = 'Head office'
    AND e.role = 'President'
ORDER BY (SELECT COUNT(*) FROM Facilities f2 WHERE f2.ministry_ID = m.ministry_ID) DESC;

/*Q2*/
/*For every educational facility in the city of Montréal, find the facility name*/
SELECT f.facility_ID, f.city, f.facilityType, f.name
FROM Facilities f
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of teachers currently working */
SELECT f.facility_ID, f.city, f.facilityType, f.name, COUNT(*) AS 'Number of Employees'
FROM Employees e
JOIN Facilities f ON e.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education' AND e.role = 'Teacher'
GROUP BY f.facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of students currently registered*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of Students'
FROM Students s
JOIN Facilities f ON s.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of the total number of teachers who got infected by COVID-19*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of teachers Infected'
FROM InfectedBy ib
JOIN Citizens c ON ib.medicareNumber = c.medicareNumber
JOIN Employees e ON c.medicareNumber = e.medicareNumber
JOIN Facilities f ON e.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education' AND e.role = 'Teacher'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of students who got infected by COVID-19*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of students Infected'
FROM InfectedBy ib
JOIN Citizens c ON ib.medicareNumber = c.medicareNumber
JOIN Students s ON c.medicareNumber = s.medicareNumber
JOIN Facilities f ON s.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of teachers who got vaccinated by at least one dose*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of teachers vaccinated(at least one dose)'
FROM TookVaccine tv
JOIN Citizens c ON tv.medicareNumber = c.medicareNumber
JOIN Employees e ON c.medicareNumber = e.medicareNumber
JOIN Facilities f ON e.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education' AND e.role = 'Teacher'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of students who got vaccinated by at least one dose*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of students vaccinated(at least one dose)'
FROM TookVaccine tv
JOIN Citizens c ON tv.medicareNumber = c.medicareNumber
JOIN Students s ON c.medicareNumber = s.medicareNumber
JOIN Facilities f ON s.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
GROUP BY facility_ID
ORDER BY f.name ASC;

-- QUERY #3
SELECT c.firstName, c.lastName, c.birthDate, c.medicareNumber, c.expiryDate, c.phone, c.email 
	FROM Citizens c
		JOIN Students s ON s.medicareNumber = c.medicareNumber 
			AND s.facility_id = (SELECT facility_id FROM Facilities WHERE name = 'Rosemont')
				AND c.expiryDate < NOW()
		JOIN InfectedBy i ON i.medicareNumber = c.medicareNumber AND i.infectionID = (SELECT infectionID FROM Infections WHERE type = 'COVID-19')
		ORDER BY c.expiryDate ASC; 

-- QUERY #4
SELECT s.medicareNumber as Medicare, c.firstName, c.lastName,c.birthDate, i1.dateInfected, inf1.type, c.email, c.phone
FROM
    Facilities f
	JOIN Students s ON s.facility_ID = f.facility_ID
	JOIN Citizens c ON c.medicareNumber = s.medicareNumber
	JOIN InfectedBy i1 ON i1.medicareNumber = c.medicareNumber
	JOIN Infections inf1 ON inf1.infectionID = i1.infectionID
	LEFT JOIN InfectedBy i2 ON i1.medicareNumber = i2.medicareNumber
					 AND i1.infectionInstanceID <> i2.infectionInstanceID
					 AND i2.dateInfected <= CURDATE()
					 AND i2.dateInfected >= CURDATE() - INTERVAL 14 DAY
	LEFT JOIN Infections inf2 ON i2.infectionID = inf2.infectionID
	WHERE
		f.city = 'Laval'
		AND i1.dateInfected <= CURDATE()
		AND i1.dateInfected >= CURDATE() - INTERVAL 14 DAY
		AND i2.infectionInstanceID IS NOT NULL
	ORDER BY c.firstName ASC, c.lastName ASC, i1.dateInfected ASC;

/*Q5*/
SELECT MIN(M.name) AS ministry_name,
       F.name AS facility_name,
       F.city,
       C.firstName,
       C.lastName,
       C.email
FROM Facilities F
JOIN Ministries M ON F.ministry_ID = M.ministry_ID
JOIN Employees E ON E.facility_ID = F.facility_ID 
JOIN Citizens C ON E.medicareNumber = C.medicareNumber
LEFT JOIN InfectedBy I ON C.medicareNumber = I.medicareNumber
WHERE I.infectionID IS NOT NULL 
AND C.medicareNumber NOT IN (SELECT medicareNumber FROM TookVaccine WHERE vaccineID IS NOT NULL)
GROUP BY F.facility_ID, C.medicareNumber
ORDER BY ministry_name ASC, F.city ASC, facility_name ASC;


/*Q6*/
SELECT distinct MIN(M.name) AS ministry_name,
       F.facility_ID,
       F.name AS facility_name,
       F.city,
	   CONCAT(C.firstName, ' ', C.lastName) AS 'Principle'
FROM Facilities F
JOIN Ministries M ON F.ministry_ID = M.ministry_ID
LEFT JOIN Employees E ON E.facility_ID = F.facility_ID
LEFT JOIN Citizens C ON E.medicareNumber = C.medicareNumber
LEFT JOIN Students S ON F.facility_ID = S.facility_ID
LEFT JOIN InfectedBy I ON E.medicareNumber = I.medicareNumber
LEFT JOIN InfectedBy I2 ON S.medicareNumber = I2.medicareNumber
WHERE I.infectionID IS NULL AND I2.infectionID IS NULL
GROUP BY F.facility_ID, F.name, F.city, C.firstName, C.lastName
ORDER BY ministry_name ASC, F.city ASC, facility_name ASC;

-- 7 - For every vaccine type, give the total number of doses taken by students in the 
-- system. Display results sorted in descending order by total number of doses.

SELECT
    v.type AS vaccine_type,
    COUNT(tv.vaccineInstanceID) AS total_doses_taken
FROM
    Vaccines v
JOIN
    TookVaccine tv ON v.vaccineID = tv.vaccineID
JOIN
    Students s ON tv.medicareNumber = s.medicareNumber
GROUP BY
    v.type
ORDER BY
    total_doses_taken DESC;

-- 8 - For every infection type in the system, give the total number of students infected 
-- by that type in each ministry. Results should be displayed sorted in ascending order 
-- by infection type, then in descending order by total number of infections

SELECT 
    i.type AS infection_type,
    m.name AS ministry_name,
    IFNULL(total_infections, 0) AS total_infections
FROM 
    Infections i
CROSS JOIN Ministries m
LEFT JOIN ( -- infections in each ministry and infection type
    SELECT 
        f.ministry_ID,
        i.type,
        COUNT(*) AS total_infections
    FROM 
        InfectedBy ib
    INNER JOIN Students s ON ib.medicareNumber = s.medicareNumber
    INNER JOIN Facilities f ON s.facility_ID = f.facility_ID
    INNER JOIN Infections i ON ib.infectionID = i.infectionID
    GROUP BY 
        f.ministry_ID,
        i.type
) AS infections_per_ministry ON m.ministry_ID = infections_per_ministry.ministry_ID AND i.type = infections_per_ministry.type
ORDER BY 
    i.type ASC,
    total_infections DESC;

-- left join: all rows of left table [x] rows in right that are in left table
-- because we want every scenario so:
-- Infections with No infection instance records /  Ministries with No Infections/ Infections with No Stude








