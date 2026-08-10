CREATE DATABASE Library_DB;
USE Library_DB;

CREATE TABLE Library_MS (
Book_ID INT PRIMARY KEY,
Book_Title VARCHAR (100),
Author_Name VARCHAR (100),
Status VARCHAR (20) DEFAULT 'Available' ,
Student_Name VARCHAR (100)
);

INSERT INTO Library_MS
(Book_ID,Book_Title,Author_Name,Status,Student_Name)
VALUES
(101, 'Engineering Mathematics', 'B. S. Grewal', 'Available', NULL),
(102, 'Programming in Python', 'Reema Thareja', 'Available', NULL),
(103, 'Database Management Systems', 'Raghu Ramakrishnan', 'Available', NULL),
(104, 'Data Structures Using C', 'Reema Thareja', 'Available', NULL),
(105, 'Computer Networks', 'Andrew S. Tanenbaum', 'Available', NULL),
(106, 'Operating System Concepts', 'Abraham Silberschatz', 'Available', NULL),
(107, 'Digital Electronics', 'Morris Mano', 'Available', NULL),
(108, 'Microprocessors and Interfacing', 'Douglas V. Hall', 'Available', NULL),
(109, 'Theory of Machines', 'S. S. Rattan', 'Available', NULL),
(110, 'Strength of Materials', 'R. K. Rajput', 'Available', NULL),
(111, 'Fluid Mechanics', 'R. K. Bansal', 'Available', NULL),
(112, 'Thermodynamics', 'P. K. Nag', 'Available', NULL),
(113, 'Machine Design', 'V. B. Bhandari', 'Available', NULL),
(114, 'Electrical Technology', 'B. L. Theraja', 'Available', NULL),
(115, 'Power System Engineering', 'I. J. Nagrath', 'Available', NULL),
(116, 'Control Systems', 'Nagrath and Gopal', 'Available', NULL),
(117, 'Engineering Mechanics', 'S. S. Bhavikatti', 'Available', NULL),
(118, 'Concrete Technology', 'M. S. Shetty', 'Available', NULL),
(119, 'Surveying', 'B. C. Punmia', 'Available', NULL),
(120, 'Environmental Engineering', 'S. K. Garg', 'Available', NULL)
;

SELECT * FROM Library_MS;

-- 1.Add a new book to the library. 
INSERT INTO Library_MS
(Book_ID,Book_Title,Author_Name,Status,Student_Name)
VALUES
(121,'Engineering Drawing', 'N. D. Bhatt', 'Available', NULL);

SELECT * FROM Library_MS;

-- 2.	Display all books 
SELECT * FROM Library_MS;

-- 3.1 - Search book by using - Book ID 
SELECT * FROM Library_MS
WHERE Book_ID = 104;

-- 3.2 - Search book by using - By Title 
SELECT * FROM Library_MS
WHERE Book_Title = 'Theory of Machines';

-- 3.3 - Search book by using - By Author
SELECT * FROM Library_MS
WHERE Author_Name = 'Reema Thareja';

-- 4.Update book details
UPDATE Library_MS
SET Book_Title = 'Computer Network System',
	Author_Name = 'Andrew Tanenbaum'
WHERE Book_ID = 105;

SELECT * FROM Library_MS
WHERE Book_ID = 105;

-- 5.Delete book
DELETE FROM Library_MS
WHERE Book_ID = 121;
SELECT * FROM Library_MS;

-- 6.Issue book 
UPDATE Library_MS
SET Status = 'Issued',
	Student_Name = 'Santosh Todmal'
WHERE Book_ID = 102;
SELECT * FROM Library_MS;

-- 7.Return book 
UPDATE Library_MS
SET Status = 'Available',
	Student_Name = NULL
WHERE Book_ID = 102;
SELECT * FROM Library_MS;

-- 8.Display available books
SELECT * 
FROM Library_MS
WHERE Status = 'Available';

--  Issue book for issue book status --
UPDATE Library_MS
SET Status = 'Issued',
	Student_Name = 'Santosh Todmal'
WHERE Book_ID = 102;

-- 9.Display issued books 
SELECT * 
FROM Library_MS
WHERE Status = 'issued';

-- 10.Exit the application 