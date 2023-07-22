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

/*Atler tables*/

/*Inserting rows*/

/*Queries*/
/*Q1*/
/**/
