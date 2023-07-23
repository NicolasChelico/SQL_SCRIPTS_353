/*Creating Table*/

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

CREATE TABLE Ministries (
ministry_ID INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
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
    infectionInstanceID INT PRIMARY KEY,
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

Create Table TookVaccine ( 
vaccineInstanceID INT PRIMARY KEY,
doseNumber INT,
vaccineID INT, 
vaccinationDate DATE, 
medicareNumber INT,
FOREIGN KEY (medicareNumber) REFERENCES Citizens(medicareNumber),
FOREIGN KEY (vaccineID) REFERENCES Vaccines(vaccineID)
);

Create Table Employees (
medicareNumber INT PRIMARY KEY,
facility_ID INT,
employeeID INT UNIQUE,
role VARCHAR(250),
specialization VARCHAR(250),
FOREIGN KEY (facility_ID) REFERENCES Facilities(facility_ID),
FOREIGN KEY (medicareNumber) REFERENCES Citizens(medicareNumber)
);

/*Atler tables(When modifications are needed*/

/*Inserting rows*/
INSERT INTO Ministries(ministry_ID, name) 
VALUES 
	(1, 'Ministry of Quebec'), 
	(2, 'Ministry of Ontario');

INSERT INTO Facilities (facility_ID, ministry_ID, name, address, city, phone, postalCode, province, capacity, webAddress, facilityType, subType)
VALUES 
	/*(1, 1, 'NotreDame', '123 Main Street', 'Montreal', '555-123-4567', 'A1B 2C3', 'Quebec', 1000, 'www.notredame.com', 'Management', 'Head office'),
	(2, 1, 'Pointe Olivier', '1234 Main Street', 'Longueuil', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary school'),
	(3, 2, 'Beaulieu', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary school'),
	(4, 2, 'Dalbe-Viau', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Secondary'),
	(5, 2, 'Somewhere', '1234 Main Street', 'Toronto', '555-153-4567', 'A1B 2C3', 'Ontario', 200, 'www.pointeolivier.com', 'Management', 'Head office'),*/
	(6, 1, 'Montagne', '1234 Main Street', 'Montreal', '555-153-4567', 'A1B 2C3', 'Quebec', 200, 'www.pointeolivier.com', 'Education', 'Primary');
    
INSERT INTO Citizens (medicareNumber, expiryDate, firstName, lastName, birthDate, citizenship, email, province, phone, city, zip, address)
VALUES 
	/*(12345, '2024-12-31', 'John', 'Doe', '1980-01-01', 'Canadian', 'johndoe@email.com', 'Quebec', '1234567890', 'Montreal', 'H1A 1A1', '123 Main St'),
    (67890, '2025-12-31', 'Jane', 'Doe', '1985-01-01', 'Canadian', 'janedoe@email.com', 'Quebec', '0987654321', 'Montreal', 'M1B 2K3', '456 Queen St'),
    (123456789, '2025-12-31', 'John', 'Smith', '2005-01-01', 'Canadian', 'john.doe@gmail.com', 'Ontario', '1234567890', 'Toronto', 'M5B2H1', '123 Street'),
    (234567890, '2026-01-31', 'Jane', 'Smith', '2004-02-02', 'Canadian', 'jane.smith@gmail.com', 'British Columbia', '2345678901', 'Vancouver', 'V5K0A1', '234 Avenue'),
    (345678901, '2027-02-28', 'Mark', 'Brown', '2003-03-03', 'Canadian', 'mark.brown@gmail.com', 'Alberta', '3456789012', 'Calgary', 'T2P2G8', '345 Boulevard'),
    (456789012, '2028-03-31', 'Mary', 'Johnson', '2002-04-04', 'Canadian', 'mary.johnson@gmail.com', 'Quebec', '4567890123', 'Montreal', 'H3B4G5', '456 Road'),
	(456789013, '2028-03-31', 'Anna', 'Fairy', '2002-04-04', 'Canadian', 'mary.johnson@gmail.com', 'Quebec', '4567890123', 'Montreal', 'H3B4G5', '456 Road');
	(11111111, '2024-07-31', 'Michael', 'Johnson', '1987-03-10', 'USA', 'michael.johnson@example.com', 'StateX', '555-111-1111', 'Anytown', 'A1B 2C3', '456 Elm Street'),
    (22222222, '2023-11-30', 'Sarah', 'Lee', '1992-08-22', 'Canada', 'sarah.lee@example.com', 'ProvinceY', '555-222-2222', 'Another City', 'D4E 5F6', '789 Maple Avenue'),
    (33333333, '2025-02-28', 'David', 'Smith', '1980-11-05', 'USA', 'david.smith@example.com', 'StateZ', '555-333-3333', 'Bigtown', 'G7H 8I9', '321 Oak Street'),
    (44444444, '2026-05-15', 'Emily', 'Brown', '1995-07-12', 'Canada', 'emily.brown@example.com', 'ProvinceW', '555-444-4444', 'Hometown', 'J2K 3L4', '987 Maple Lane'),
    (55555555, '2023-09-30', 'Daniel', 'Anderson', '1983-01-18', 'USA', 'daniel.anderson@example.com', 'StateX', '555-555-5555', 'Cityville', 'M5N 6P7', '654 Elm Avenue'),
    (66666666, '2025-01-10', 'Jessica', 'Wilson', '1990-06-25', 'Canada', 'jessica.wilson@example.com', 'ProvinceY', '555-666-6666', 'Villageville', 'R3S 5T6', '789 Oak Lane'),
    (77777777, '2024-12-01', 'Andrew', 'Martin', '1985-09-17', 'USA', 'andrew.martin@example.com', 'StateZ', '555-777-7777', 'Metroville', 'U8V 9W1', '123 Maple Road'),
    (88888888, '2023-08-22', 'Olivia', 'Walker', '1998-12-05', 'Canada', 'olivia.walker@example.com', 'ProvinceW', '555-888-8888', 'Townsville', 'T5Y 6Z7', '456 Oak Lane'),
    (99999999, '2022-11-18', 'William', 'Garcia', '1993-04-29', 'USA', 'william.garcia@example.com', 'StateX', '555-999-9999', 'Citytown', 'H2J 4R5', '789 Elm Road'),
    (123, '2022-11-18', 'William', 'Garcia', '1993-04-29', 'USA', 'william.garcia@example.com', 'StateX', '555-999-9999', 'Citytown', 'H2J 4R5', '789 Elm Road'),*/
	(124, '2022-11-18', 'William', 'Garcia', '1993-04-29', 'USA', 'william.garcia@example.com', 'StateX', '555-999-9999', 'Citytown', 'H2J 4R5', '789 Elm Road');


INSERT INTO Students (medicareNumber, studentID, facility_ID, grade) 
VALUES 
	/*(11111111, 1, 3, 'Grade 1'),
	(22222222, 2, 3, 'Grade 2'),
	(33333333, 3, 4, 'Grade 3'),
	(44444444, 4, 4, 'Grade 4'),
    (55555555, 5, 4, 'Grade 4'),*/
    (124, 6, 4, 'Grade 4');
    
    
    
INSERT INTO Employees (medicareNumber, facility_ID, employeeID, role, specialization)
VALUES 
    /*(12345, 1, 101, 'President', NULL),
    (67890, 2, 102, 'Security', NULL),
    (123456789, 3, 103, 'Teacher', NULL),
    (234567890, 3, 104, 'Teacher', NULL),
    (345678901, 4, 105, 'Teacher', 'Mathematics'),
    (456789012, 4, 106, 'Teacher', 'French'),
    (456789013, 4, 107, 'Teacher', 'French'),*/
    (123, 2, 108, 'President', NULL);

INSERT INTO InfectedBy (infectionInstanceID, medicareNumber, infectionID, dateInfected)
VALUES 
   /* (1, 123456789, 101, '2023-07-10'),
    (2, 234567890, 101, '2023-07-10'),
    (3, 345678901, 101, '2023-07-10'),
	(4, 11111111, 101,'2023-07-10'),
	(5,22222222, 101,'2023-07-10'),
	(6, 33333333,101,'2023-07-10'),*/
    (7, 44444444,101,'2023-07-10');

INSERT INTO Infections (infectionID, type)
VALUES 
    (101, 'COVID-19'),
    (102, 'Influenza'),
    (103, 'Common Cold'),
    (104, 'Pneumonia'),
    (105, 'Strep Throat'),
    (106, 'Gastroenteritis'),
    (107, 'Bronchitis'),
    (108, 'Tuberculosis'),
    (109, 'Malaria');
    
INSERT INTO Vaccines (vaccineID, type)
VALUES 
    (1, 'Pfizer-BioNTech'),
    (2, 'Moderna'),
    (3, 'Johnson & Johnson'),
    (4, 'AstraZeneca'),
    (5, 'Sinovac'),
    (6, 'Sputnik V'),
    (7, 'Novavax'),
    (8, 'Covaxin'),
    (9, 'Sinopharm');

INSERT INTO TookVaccine (vaccineInstanceID, doseNumber, vaccineID, vaccinationDate, medicareNumber)
VALUES 
    (1, 1, 1, '2023-07-05', 123456789),
    (2, 1, 1, '2023-07-07', 345678901),
    (3, 1, 2, '2023-07-10', 456789012),
	(4, 1, 1, '2023-07-12', 11111111),
    (5, 1, 1, '2023-07-15', 22222222),
    (6, 1, 1, '2023-07-18', 33333333),
    (7, 1, 1, '2023-07-20', 44444444),
    (8, 1, 1, '2023-07-22', 55555555);


/*Queries*/
/*Q1*/
/*get the province name where the ministry is located and the name of the minister of education for each ministry*/
SELECT m.ministry_ID, m.name, f.province, CONCAT(c.firstName, ' ', c.lastName) AS 'Minister of Education'
FROM ministries m
JOIN facilities f ON m.ministry_ID = f.ministry_ID
JOIN Employees e ON e.facility_ID = f.facility_ID
JOIN citizens c ON c.medicareNumber = e.medicareNumber
WHERE 
	f.facilityType = 'Management' AND f.subType = 'Head office'
    AND e.role = 'President';

/*the number of facilities within the ministry*/    
SELECT m.ministry_ID, m.name, COUNT(*) AS 'Number of facilities'
FROM facilities f
JOIN ministries m ON m.ministry_ID = f.ministry_ID
GROUP BY ministry_ID;

/*the total number of employees currently working for all the facilities in the ministry*/
SELECT m.ministry_ID, m.name, COUNT(*) AS 'Number of employees'
FROM employees e
JOIN facilities f ON e.facility_ID = f.facility_ID
JOIN ministries m ON f.ministry_ID = m.ministry_ID
GROUP BY m.ministry_ID;

/*the total number of students currently registered in the schools within the ministry*/
SELECT m.ministry_ID, m.name, COUNT(*) AS 'Number of students'
FROM students s
JOIN facilities f ON s.facility_ID = f.facility_ID
JOIN ministries m ON f.ministry_ID = m.ministry_ID  
GROUP BY m.ministry_ID;

/*Q1 all queries in one*/
SELECT 
    m.ministry_ID, 
    m.name, 
    f.province, 
    CONCAT(c.firstName, ' ', c.lastName) AS 'Minister of Education',
    (SELECT COUNT(*) FROM facilities f2 WHERE f2.ministry_ID = m.ministry_ID) AS 'Number of facilities',
    (SELECT COUNT(*) FROM employees e2 
     JOIN facilities f2 ON e2.facility_ID = f2.facility_ID 
     WHERE f2.ministry_ID = m.ministry_ID) AS 'Number of employees',
    (SELECT COUNT(*) FROM students s2 
     JOIN facilities f2 ON s2.facility_ID = f2.facility_ID 
     WHERE f2.ministry_ID = m.ministry_ID) AS 'Number of students'
FROM 
    ministries m
    JOIN facilities f ON m.ministry_ID = f.ministry_ID
    JOIN Employees e ON e.facility_ID = f.facility_ID
    JOIN citizens c ON c.medicareNumber = e.medicareNumber
WHERE 
	f.facilityType = 'Management' AND f.subType = 'Head office'
    AND e.role = 'President'
ORDER BY (SELECT COUNT(*) FROM facilities f2 WHERE f2.ministry_ID = m.ministry_ID) DESC;

/*Q2*/
/*For every educational facility in the city of Montréal, find the facility name*/
SELECT f.facility_ID, f.city, f.facilityType, f.name
FROM facilities f
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of teachers currently working */
SELECT f.facility_ID, f.city, f.facilityType, f.name, COUNT(*) AS 'Number of Employees'
FROM employees e
JOIN facilities f ON e.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education' AND e.role = 'Teacher'
GROUP BY f.facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of students currently registered*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of Students'
FROM students s
JOIN facilities f ON s.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of the total number of teachers who got infected by COVID-19*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of teachers Infected'
FROM infectedby ib
JOIN citizens c ON ib.medicareNumber = c.medicareNumber
JOIN employees e ON c.medicareNumber = e.medicareNumber
JOIN facilities f ON e.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education' AND e.role = 'Teacher'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of students who got infected by COVID-19*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of students Infected'
FROM infectedby ib
JOIN citizens c ON ib.medicareNumber = c.medicareNumber
JOIN students s ON c.medicareNumber = s.medicareNumber
JOIN facilities f ON s.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of teachers who got vaccinated by at least one dose*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of teachers vaccinated(at least one dose)'
FROM tookvaccine tv
JOIN citizens c ON tv.medicareNumber = c.medicareNumber
JOIN employees e ON c.medicareNumber = e.medicareNumber
JOIN facilities f ON e.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education' AND e.role = 'Teacher'
GROUP BY facility_ID
ORDER BY f.name ASC;

/*For every educational facility in the city of Montréal, find the total number of students who got vaccinated by at least one dose*/
SELECT f.facility_ID, f.city, f.facilityType, f.name,  COUNT(*) AS 'Number of students vaccinated(at least one dose)'
FROM tookvaccine tv
JOIN citizens c ON tv.medicareNumber = c.medicareNumber
JOIN students s ON c.medicareNumber = s.medicareNumber
JOIN facilities f ON s.facility_ID = f.facility_ID
WHERE f.city = 'Montreal' AND f.facilityType = 'Education'
GROUP BY facility_ID
ORDER BY f.name ASC;