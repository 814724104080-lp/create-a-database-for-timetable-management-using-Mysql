-- Create Database
CREATE DATABASE TimeTableManagement;

-- Use Database
USE TimeTableManagement;

-- Create Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

-- Create Teacher Table
CREATE TABLE Teacher (
    Teacher_ID INT PRIMARY KEY,
    Teacher_Name VARCHAR(50),
    Subject VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Create Classroom Table
CREATE TABLE Classroom (
    Room_ID INT PRIMARY KEY,
    Room_Name VARCHAR(20),
    Capacity INT
);

-- Create Subject Table
CREATE TABLE Subject (
    Subject_ID INT PRIMARY KEY,
    Subject_Name VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Create Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Dept_ID INT,
    Year_Of_Study INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Create Timetable Table
CREATE TABLE Timetable (
    Timetable_ID INT PRIMARY KEY,
    Day VARCHAR(20),
    Period_No INT,
    Subject_ID INT,
    Teacher_ID INT,
    Room_ID INT,
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
    FOREIGN KEY (Room_ID) REFERENCES Classroom(Room_ID)
);

-- Insert Department Data
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology');

-- Insert Teacher Data
INSERT INTO Teacher VALUES
(101, 'Ravi Kumar', 'DBMS', 1),
(102, 'Priya Sharma', 'Java', 1);

-- Insert Classroom Data
INSERT INTO Classroom VALUES
(1, 'A101', 60),
(2, 'B201', 50);

-- Insert Subject Data
INSERT INTO Subject VALUES
(201, 'DBMS', 1),
(202, 'Java Programming', 1);

-- Insert Student Data
INSERT INTO Student VALUES
(1, 'Arun', 1, 2),
(2, 'Kaviya', 1, 2);

-- Insert Timetable Data
INSERT INTO Timetable VALUES
(1, 'Monday', 1, 201, 101, 1),
(2, 'Monday', 2, 202, 102, 2);

-- Display Timetable
SELECT 
    T.Day,
    T.Period_No,
    S.Subject_Name,
    TR.Teacher_Name,
    C.Room_Name
FROM Timetable T
JOIN Subject S ON T.Subject_ID = S.Subject_ID
JOIN Teacher TR ON T.Teacher_ID = TR.Teacher_ID
JOIN Classroom C ON T.Room_ID = C.Room_ID;