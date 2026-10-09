Create Database Healthcare ;
Use Healthcare;

create table Members (
member_id INT PRIMARY KEY,
first_name TEXT,
last_name TEXT,
gender TEXT,
dob DATE,
registered_on DATE
);

create table Plans(
plan_id INT PRIMARY KEY,
plan_name TEXT,
coverage_type TEXT,
premium DECIMAL
);

create table Enrollments(
enrollment_id INT PRIMARY KEY,
member_id INT,
plan_id INT,
enrolled_on DATE,
status TEXT,
submitted_by TEXT,
FOREIGN KEY(member_id) REFERENCES Members(member_id),
FOREIGN KEY(plan_id) REFERENCES Plans(plan_id)
);

create table Discrepancies(
discrepancy_id INT PRIMARY KEY,
enrollment_id INT,
issue_type TEXT,
reported_on DATE,
resolved_on DATE,
resolution_notes TEXT,
FOREIGN KEY (enrollment_id) REFERENCES Enrollments (enrollment_id)
);

create table Audit_Log(
audit_id INT PRIMARY KEY,
user_id TEXT,
action_type TEXT,
table_affected TEXT,
action_timestamp DATETIME
);

INSERT INTO Members
(member_id, first_name, last_name, gender, dob, registered_on)
VALUES
(1, 'Olivia', 'Harrison', 'Other', '1995-02-21', '2018-02-14'),
(2, 'Kaylee', 'Dickerson', 'M', '1968-03-16', '1998-07-13'),
(3, 'Jack', 'Allen', 'M', '1965-01-01', '1993-01-01'),
(4, 'Karen', 'Fletcher', 'M', '2000-04-25', '2022-11-25'),
(5, 'Brent', 'Howard', 'Other', '1975-05-29', '2017-11-09'),
(6, 'Brian', 'Perez', 'M', '1992-12-11', '2037-06-02'),
(7, 'Adrian', 'Burton', 'F', '1950-12-06', '1970-05-05'),
(8, 'James', 'Powell', 'M', '1981-02-11', '2003-04-22'),
(9, 'Martha', 'Garcia', 'M', '1954-03-14', '1982-08-15'),
(10, 'Jesus', 'Lopez', 'Other', '1958-08-08', '2003-08-05'),
(11, 'Omar', 'Cooper', 'M', '1989-08-25', '2032-10-23'),
(12, 'Thomas', 'Rodriguez', 'M', '1975-10-22', '2022-12-11'),
(13, 'Justin', 'White', 'Other', '1995-07-08', '2037-12-12'),
(14, 'Dana', 'Gonzalez', 'F', '1958-09-21', '1986-08-06'),
(15, 'Leah', 'King', 'F', '1973-03-01', '2017-08-01'),
(16, 'Alexis', 'Bowers', 'F', '2006-11-19', '2025-02-28'),
(17, 'Amanda', 'Gonzalez', 'M', '1996-12-09', '2046-03-30'),
(18, 'Andrea', 'Murphy', 'F', '1949-07-27', '1982-10-26'),
(19, 'Jennifer', 'Wilson', 'F', '2007-01-09', '2031-12-26'),
(20, 'Peter', 'Woods', 'M', '1970-07-22', '2003-08-22'),
(21, 'Sabrina', 'Berry', 'M', '1973-07-03', '1995-08-26'),
(22, 'Stephanie', 'Stevenson', 'F', '1958-01-26', '1980-05-24'),
(23, 'Earl', 'Hicks', 'F', '1967-04-14', '2000-09-12'),
(24, 'George', 'Torres', 'Other', '1967-02-01', '1996-12-08'),
(25, 'Kim', 'Mccarty', 'M', '1979-06-15', '2018-01-18'),
(26, 'Felicia', 'Franklin', 'Other', '1975-10-14', '1999-05-16'),
(27, 'Kimberly', 'Ball', 'F', '1979-10-28', '2001-05-06'),
(28, 'Tonya', 'Sanders', 'Other', '1955-06-01', '1986-07-21'),
(29, 'Michael', 'Adams', 'Other', '2001-10-13', '2047-07-07'),
(30, 'Maria', 'Weber', 'F', '1994-07-10', '2038-05-29'),
(31, 'Brandon', 'Love', 'M', '1964-10-08', '2014-05-12'),
(32, 'Isaiah', 'Smith', 'M', '2001-07-11', '2021-07-26'),
(33, 'Claire', 'Taylor', 'Other', '1976-07-03', '2004-09-17'),
(34, 'Philip', 'Cummings', 'F', '1987-08-17', '2009-03-11'),
(35, 'Stephanie', 'Hobbs', 'M', '1971-05-28', '1993-12-02'),
(36, 'Harold', 'Greer', 'F', '1994-10-19', '2025-04-03'),
(37, 'Sandra', 'Simmons', 'F', '1960-05-29', '2006-11-29'),
(38, 'Cameron', 'Valenzuela', 'F', '1977-05-02', '2002-08-13'),
(39, 'Catherine', 'Hunter', 'F', '1955-09-07', '1989-08-09'),
(40, 'Matthew', 'Walker', 'M', '1970-06-25', '2018-07-13'),
(41, 'Mary', 'Anderson', 'F', '1986-04-01', '2035-09-19'),
(42, 'Paula', 'Sloan', 'Other', '1964-03-22', '2011-04-12'),
(43, 'Lisa', 'Kline', 'M', '1952-02-08', '1997-06-01'),
(44, 'Holly', 'Ramirez', 'Other', '1958-03-22', '1983-11-19'),
(45, 'Kevin', 'Vasquez', 'Other', '1973-07-09', '2002-06-27'),
(46, 'Travis', 'Cox', 'M', '1966-12-30', '2005-09-19'),
(47, 'Shirley', 'Mason', 'F', '1988-04-22', '2018-05-27'),
(48, 'Daniel', 'Leblanc', 'Other', '1971-08-31', '2020-07-08'),
(49, 'David', 'Mullins', 'Other', '1971-07-02', '1999-05-04'),
(50, 'Christopher', 'Johnson', 'Other', '2006-07-12', '2039-01-23'),
(51, 'Tracy', 'Carter', 'M', '1980-12-14', '2009-03-19'),
(52, 'William', 'Montoya', 'M', '2007-03-05', '2039-04-24'),
(53, 'Madeline', 'Wright', 'F', '1974-05-07', '2004-05-05'),
(54, 'Francis', 'Thompson', 'M', '1966-01-10', '1993-06-23'),
(55, 'Daniel', 'Pearson', 'Other', '1989-10-28', '2021-12-04'),
(56, 'Kimberly', 'Bryant', 'M', '2006-12-29', '2054-05-19'),
(57, 'Nathan', 'Estrada', 'F', '1992-06-03', '2028-02-27'),
(58, 'Samuel', 'Mitchell', 'Other', '1958-09-07', '1997-04-02'),
(59, 'Valerie', 'Jordan', 'M', '1964-05-12', '1994-03-25'),
(60, 'Jeffrey', 'Romero', 'M', '2006-11-07', '2035-11-25'),
(61, 'Julie', 'Carpenter', 'Other', '1955-07-22', '1998-09-21'),
(62, 'Alyssa', 'Graham', 'Other', '1996-05-06', '2026-02-12'),
(63, 'Jim', 'Aguilar', 'Other', '1979-02-01', '2023-04-18'),
(64, 'Christina', 'Reynolds', 'F', '2000-04-13', '2044-06-11'),
(65, 'Luke', 'Gamble', 'F', '1988-06-15', '2022-09-05'),
(66, 'Kristen', 'Perry', 'M', '1969-08-19', '1993-10-28'),
(67, 'Christopher', 'Watson', 'Other', '1951-08-16', '1991-09-30'),
(68, 'Jennifer', 'Woods', 'M', '1987-03-11', '2007-04-16'),
(69, 'Luis', 'Lopez', 'M', '1979-04-04', '2004-02-06'),
(70, 'Kayla', 'Alvarez', 'Other', '1977-07-14', '2002-09-12'),
(71, 'Michelle', 'Barrett', 'Other', '2000-12-19', '2037-11-21'),
(72, 'William', 'George', 'Other', '1987-04-02', '2008-02-01'),
(73, 'Adam', 'Hunter', 'F', '1991-05-06', '2026-06-13'),
(74, 'Anthony', 'Salinas', 'Other', '1994-12-05', '2033-11-28'),
(75, 'Heather', 'Marshall', 'Other', '1993-05-10', '2022-08-15'),
(76, 'Tiffany', 'Tucker', 'Other', '1960-10-30', '1979-05-02'),
(77, 'Jennifer', 'Johnson', 'Other', '2004-12-21', '2028-02-05'),
(78, 'Emily', 'Nguyen', 'Other', '2003-09-10', '2045-10-06'),
(79, 'Jacob', 'Washington', 'F', '1992-12-05', '2039-09-01'),
(80, 'Nicole', 'Fuentes', 'F', '1978-12-04', '2001-11-30'),
(81, 'Jason', 'Williams', 'F', '1981-06-10', '2018-12-06'),
(82, 'Daniel', 'White', 'M', '1973-09-05', '2012-01-07'),
(83, 'Joseph', 'Parker', 'M', '1954-12-27', '1984-10-15'),
(84, 'Laura', 'Burns', 'Other', '1978-11-06', '2004-11-06'),
(85, 'Jason', 'Russell', 'Other', '1996-07-02', '2019-04-06'),
(86, 'Luis', 'Leonard', 'Other', '1950-10-04', '1982-02-17'),
(87, 'Joshua', 'Glass', 'Other', '1997-02-13', '2037-11-17'),
(88, 'Matthew', 'Buckley', 'Other', '1966-05-22', '1993-04-18'),
(89, 'Richard', 'Weaver', 'M', '1951-07-02', '1986-04-05'),
(90, 'Ronald', 'Bailey', 'M', '1952-07-06', '1994-09-11'),
(91, 'Teresa', 'Duke', 'Other', '1953-06-06', '1971-06-11'),
(92, 'Derrick', 'Nichols', 'Other', '1950-05-09', '1982-11-17'),
(93, 'Michael', 'Lee', 'F', '1966-02-14', '1984-12-25'),
(94, 'Yvonne', 'Fields', 'M', '1955-01-25', '1989-05-03'),
(95, 'Curtis', 'Anderson', 'F', '1975-03-02', '2003-11-23'),
(96, 'Michelle', 'Wright', 'M', '1952-06-24', '1981-04-09'),
(97, 'Amber', 'Harrell', 'Other', '1989-12-17', '2011-06-25'),
(98, 'Hannah', 'Kim', 'M', '1991-03-05', '2030-12-17'),
(99, 'Jonathan', 'Torres', 'M', '2003-04-17', '2045-03-04'),
(100, 'Ashley', 'King', 'M', '1961-05-11', '1985-02-07')
;

INSERT INTO Plans
(plan_id, plan_name, coverage_type, premium)
VALUES
(1, 'Silver Basic', 'Individual', 300.0),
(2, 'Gold Premium', 'Family', 650.0),
(3, 'Platinum Plus', 'Individual', 500.0),
(4, 'Essential Care', 'Family', 400.0),
(5, 'Health Guard', 'Individual', 350.0)
;

INSERT INTO Enrollments
(enrollment_id, member_id, plan_id, enrolled_on, status, submitted_by)
VALUES
(1, 71, 2, '2023-09-06', 'Enrolled', 'AgentD'),
(2, 28, 5, '2024-05-29', 'Rejected', 'AgentB'),
(3, 92, 3, '2025-01-29', 'Enrolled', 'AgentC'),
(4, 57, 5, '2025-01-05', 'Enrolled', 'AgentB'),
(5, 29, 1, '2025-02-13', 'Enrolled', 'AgentB'),
(6, 76, 2, '2024-07-16', 'Enrolled', 'AgentA'),
(7, 30, 1, '2024-11-20', 'Pending', 'AgentC'),
(8, 10, 5, '2023-11-26', 'Enrolled', 'AgentD'),
(9, 28, 5, '2024-05-25', 'Enrolled', 'AgentD'),
(10, 32, 4, '2025-02-01', 'Rejected', 'AgentB'),
(11, 13, 1, '2024-03-19', 'Rejected', 'AgentC'),
(12, 55, 4, '2024-03-21', 'Enrolled', 'AgentA'),
(13, 87, 1, '2024-08-10', 'Enrolled', 'AgentC'),
(14, 14, 2, '2024-04-21', 'Enrolled', 'AgentD'),
(15, 18, 4, '2025-04-11', 'Enrolled', 'AgentD'),
(16, 32, 1, '2024-03-19', 'Enrolled', 'AgentA'),
(17, 7, 5, '2025-01-13', 'Rejected', 'AgentA'),
(18, 97, 2, '2023-08-30', 'Enrolled', 'AgentD'),
(19, 62, 2, '2024-04-19', 'Rejected', 'AgentA'),
(20, 22, 4, '2024-09-14', 'Enrolled', 'AgentD'),
(21, 34, 4, '2024-10-27', 'Enrolled', 'AgentD'),
(22, 20, 2, '2023-08-25', 'Enrolled', 'AgentA'),
(23, 75, 5, '2024-12-25', 'Enrolled', 'AgentC'),
(24, 8, 1, '2023-08-30', 'Enrolled', 'AgentB'),
(25, 8, 5, '2024-01-17', 'Enrolled', 'AgentB'),
(26, 9, 5, '2024-07-27', 'Enrolled', 'AgentB'),
(27, 52, 1, '2025-06-22', 'Pending', 'AgentB'),
(28, 75, 5, '2025-05-23', 'Enrolled', 'AgentA'),
(29, 54, 5, '2024-01-20', 'Enrolled', 'AgentC'),
(30, 34, 2, '2024-04-27', 'Rejected', 'AgentC'),
(31, 31, 3, '2024-10-26', 'Enrolled', 'AgentC'),
(32, 59, 3, '2024-11-13', 'Pending', 'AgentA'),
(33, 2, 4, '2025-06-21', 'Rejected', 'AgentA'),
(34, 10, 5, '2024-01-31', 'Enrolled', 'AgentC'),
(35, 17, 3, '2024-09-07', 'Rejected', 'AgentB'),
(36, 48, 3, '2024-01-27', 'Enrolled', 'AgentC'),
(37, 79, 5, '2024-08-24', 'Enrolled', 'AgentC'),
(38, 85, 1, '2024-02-07', 'Pending', 'AgentB'),
(39, 34, 1, '2025-05-03', 'Rejected', 'AgentB'),
(40, 35, 3, '2024-10-19', 'Rejected', 'AgentC'),
(41, 27, 3, '2024-03-28', 'Enrolled', 'AgentC'),
(42, 7, 1, '2025-01-21', 'Rejected', 'AgentC'),
(43, 6, 1, '2025-01-07', 'Enrolled', 'AgentB'),
(44, 82, 3, '2024-09-13', 'Enrolled', 'AgentD'),
(45, 71, 4, '2024-06-01', 'Enrolled', 'AgentA'),
(46, 10, 2, '2024-09-27', 'Enrolled', 'AgentC'),
(47, 75, 5, '2024-04-22', 'Enrolled', 'AgentB'),
(48, 6, 3, '2024-06-21', 'Enrolled', 'AgentA'),
(49, 46, 2, '2023-08-26', 'Rejected', 'AgentA'),
(50, 46, 5, '2024-11-17', 'Rejected', 'AgentD'),
(51, 80, 2, '2024-08-18', 'Pending', 'AgentB'),
(52, 21, 2, '2023-10-30', 'Rejected', 'AgentA'),
(53, 23, 3, '2025-06-12', 'Rejected', 'AgentD'),
(54, 86, 2, '2024-08-29', 'Enrolled', 'AgentA'),
(55, 49, 1, '2024-03-26', 'Rejected', 'AgentB'),
(56, 26, 4, '2025-01-06', 'Enrolled', 'AgentB'),
(57, 29, 1, '2025-05-07', 'Rejected', 'AgentD'),
(58, 43, 3, '2023-07-07', 'Rejected', 'AgentC'),
(59, 45, 5, '2024-10-16', 'Enrolled', 'AgentC'),
(60, 4, 1, '2024-11-15', 'Rejected', 'AgentC'),
(61, 23, 5, '2023-08-14', 'Pending', 'AgentC'),
(62, 5, 1, '2024-10-02', 'Enrolled', 'AgentC'),
(63, 94, 3, '2024-11-30', 'Enrolled', 'AgentA'),
(64, 50, 5, '2024-08-02', 'Enrolled', 'AgentA'),
(65, 91, 4, '2024-11-08', 'Enrolled', 'AgentB'),
(66, 47, 4, '2024-11-14', 'Enrolled', 'AgentC'),
(67, 80, 3, '2024-12-13', 'Rejected', 'AgentA'),
(68, 93, 3, '2025-05-08', 'Enrolled', 'AgentD'),
(69, 42, 4, '2024-07-21', 'Rejected', 'AgentB'),
(70, 25, 4, '2023-11-02', 'Rejected', 'AgentD'),
(71, 87, 2, '2024-07-28', 'Rejected', 'AgentC'),
(72, 52, 5, '2023-12-01', 'Rejected', 'AgentC'),
(73, 37, 2, '2024-02-18', 'Enrolled', 'AgentC'),
(74, 60, 4, '2023-08-04', 'Enrolled', 'AgentB'),
(75, 66, 4, '2023-06-25', 'Rejected', 'AgentB'),
(76, 85, 1, '2025-05-17', 'Enrolled', 'AgentC'),
(77, 12, 2, '2024-01-17', 'Rejected', 'AgentB'),
(78, 26, 2, '2024-02-24', 'Enrolled', 'AgentB'),
(79, 61, 5, '2024-05-12', 'Rejected', 'AgentA'),
(80, 59, 4, '2023-07-09', 'Rejected', 'AgentB'),
(81, 92, 4, '2025-04-07', 'Enrolled', 'AgentB'),
(82, 19, 1, '2024-01-25', 'Rejected', 'AgentA'),
(83, 100, 4, '2025-01-12', 'Enrolled', 'AgentD'),
(84, 7, 5, '2023-10-25', 'Enrolled', 'AgentA'),
(85, 59, 2, '2023-08-11', 'Rejected', 'AgentC'),
(86, 97, 4, '2024-10-29', 'Rejected', 'AgentD'),
(87, 71, 4, '2024-04-03', 'Rejected', 'AgentD'),
(88, 58, 3, '2023-09-09', 'Rejected', 'AgentC'),
(89, 99, 5, '2023-09-09', 'Enrolled', 'AgentB'),
(90, 36, 4, '2025-03-30', 'Enrolled', 'AgentC'),
(91, 31, 3, '2024-11-15', 'Enrolled', 'AgentA'),
(92, 18, 2, '2025-03-15', 'Enrolled', 'AgentB'),
(93, 91, 2, '2025-04-06', 'Enrolled', 'AgentD'),
(94, 43, 5, '2023-09-17', 'Enrolled', 'AgentA'),
(95, 27, 4, '2024-01-25', 'Enrolled', 'AgentA'),
(96, 98, 5, '2024-01-25', 'Enrolled', 'AgentA'),
(97, 46, 3, '2023-12-20', 'Rejected', 'AgentD'),
(98, 69, 5, '2025-03-08', 'Rejected', 'AgentB'),
(99, 63, 2, '2023-09-03', 'Enrolled', 'AgentD'),
(100, 4, 4, '2023-11-06', 'Enrolled', 'AgentD')
;

INSERT INTO Discrepancies
(discrepancy_id, enrollment_id, issue_type, reported_on, resolved_on, resolution_notes)
VALUES
(1, 93, 'Incomplete Info', '2023-09-25', '2023-10-09', 'Affect big goal interesting represent including measure left.'),
(2, 60, 'Incomplete Info', '2024-01-02', '2024-01-12', 'Dark money paper late race.'),
(3, 69, 'Data Mismatch', '2023-06-23', '2023-07-08', 'Traditional sell shake probably lawyer.'),
(4, 51, 'Data Mismatch', '2024-05-05', '2024-05-07', 'Someone against age resource.'),
(5, 83, 'Invalid ID', '2024-04-28', '2024-05-01', 'Phone join trip team staff offer wall painting.'),
(6, 60, 'Incomplete Info', '2024-05-10', '2024-05-11', 'Last nature stop on.'),
(7, 34, 'Invalid ID', '2024-02-16', '2024-02-22', 'Establish quickly either check another respond.'),
(8, 28, 'Invalid ID', '2024-05-07', '2024-05-13', 'Drug center source arrive.'),
(9, 44, 'Invalid ID', '2024-02-16', '2024-02-21', 'Charge campaign case carry though.'),
(10, 97, 'Invalid ID', '2023-10-05', '2023-10-10', 'Anyone police class they hour last.'),
(11, 11, 'Invalid ID', '2024-02-20', '2024-02-21', 'Perhaps reflect sport item.'),
(12, 96, 'Data Mismatch', '2023-07-02', '2023-07-08', 'Third compare different get give family.'),
(13, 29, 'Data Mismatch', '2024-06-21', '2024-07-04', 'This such change season daughter eye head.'),
(14, 84, 'Data Mismatch', '2024-06-03', '2024-06-16', 'So only far.'),
(15, 4, 'Incomplete Info', '2023-09-12', '2023-09-16', 'Throw range certain ago American.'),
(16, 3, 'Incomplete Info', '2023-06-23', '2023-06-27', 'American wind trade close evening.'),
(17, 17, 'Invalid ID', '2024-03-21', '2024-04-01', 'Behavior poor rate alone simply challenge live page.'),
(18, 15, 'Incomplete Info', '2023-07-10', '2023-07-18', 'Itself picture quality while among.'),
(19, 90, 'Duplicate Record', '2024-04-23', '2024-05-06', 'Card policy kitchen Mr seven blood degree help.'),
(20, 48, 'Incomplete Info', '2023-10-13', '2023-10-23', 'Science bit reveal former cost each from.'),
(21, 78, 'Data Mismatch', '2024-05-12', '2024-05-25', 'Seven property build include.'),
(22, 21, 'Duplicate Record', '2024-05-30', '2024-06-01', 'Street reach gas magazine high any large.'),
(23, 75, 'Data Mismatch', '2023-08-12', '2023-08-27', 'Old opportunity early culture television.'),
(24, 40, 'Invalid ID', '2024-02-24', '2024-03-02', 'Force know life pick attack fight computer green.'),
(25, 92, 'Incomplete Info', '2024-01-18', '2024-01-20', 'Player activity avoid no teach pressure involve.'),
(26, 76, 'Incomplete Info', '2024-03-04', '2024-03-06', 'Arrive loss crime capital shake.'),
(27, 90, 'Duplicate Record', '2023-07-19', '2023-08-02', 'South argue idea executive thing individual.'),
(28, 88, 'Data Mismatch', '2023-08-04', '2023-08-17', 'Now agent turn nearly away issue occur.'),
(29, 73, 'Data Mismatch', '2023-09-03', '2023-09-09', 'Large happy wonder series.'),
(30, 69, 'Invalid ID', '2023-10-13', '2023-10-24', 'Add baby important former still join receive.'),
(31, 48, 'Data Mismatch', '2024-02-24', '2024-03-04', 'Book other cell seem.'),
(32, 83, 'Duplicate Record', '2024-01-25', '2024-01-26', 'Special plan others the.'),
(33, 54, 'Invalid ID', '2024-04-15', '2024-04-17', 'Most method teach including anything.'),
(34, 56, 'Duplicate Record', '2024-01-02', '2024-01-13', 'Send break edge type poor blood conference claim.'),
(35, 59, 'Incomplete Info', '2024-01-27', '2024-02-03', 'Ahead heavy city food father capital control.'),
(36, 23, 'Duplicate Record', '2024-02-13', '2024-02-23', 'Sure level manager partner experience.'),
(37, 69, 'Invalid ID', '2023-08-26', '2023-09-03', 'Act term soon future.'),
(38, 56, 'Duplicate Record', '2023-09-21', '2023-09-27', 'Only better his west anyone choose.'),
(39, 32, 'Data Mismatch', '2023-07-23', '2023-07-28', 'Sound bring phone trade.'),
(40, 58, 'Incomplete Info', '2023-07-23', '2023-08-05', 'Special section can front none born.'),
(41, 60, 'Invalid ID', '2023-11-07', '2023-11-13', 'Sell north less until.'),
(42, 4, 'Invalid ID', '2024-01-26', '2024-02-09', 'Our modern property candidate service.'),
(43, 42, 'Incomplete Info', '2023-10-30', '2023-11-07', 'Point visit receive the.'),
(44, 28, 'Duplicate Record', '2024-01-15', '2024-01-28', 'Agency Democrat price to loss down time.'),
(45, 34, 'Duplicate Record', '2023-12-17', '2023-12-22', 'Least administration decade both better leader.'),
(46, 77, 'Duplicate Record', '2024-05-23', '2024-06-01', 'What finally idea wife boy section political.'),
(47, 2, 'Incomplete Info', '2023-07-28', '2023-07-30', 'Son member cover.'),
(48, 31, 'Invalid ID', '2023-07-28', '2023-08-05', 'Decide hotel no mind offer.'),
(49, 72, 'Incomplete Info', '2024-05-13', '2024-05-25', 'Former know method.'),
(50, 61, 'Invalid ID', '2024-05-03', '2024-05-11', 'Difficult different forward or run street.'),
(51, 3, 'Data Mismatch', '2023-09-29', '2023-10-04', 'Tree economic hundred floor specific purpose senior.'),
(52, 29, 'Invalid ID', '2023-08-11', '2023-08-23', 'Sell Republican short.'),
(53, 32, 'Duplicate Record', '2023-09-15', '2023-09-26', 'South various address degree night car idea.'),
(54, 75, 'Duplicate Record', '2023-12-19', '2023-12-27', 'Too right local customer board gun.'),
(55, 71, 'Duplicate Record', '2024-03-21', '2024-03-28', 'Choose theory write animal strategy rise.'),
(56, 96, 'Duplicate Record', '2024-05-29', '2024-06-04', 'Design center idea industry.'),
(57, 90, 'Invalid ID', '2023-12-10', '2023-12-15', 'White relate establish hot administration study.'),
(58, 40, 'Duplicate Record', '2024-03-19', '2024-03-23', 'Five eye certain break while push avoid.'),
(59, 16, 'Incomplete Info', '2023-12-16', '2023-12-22', 'Senior contain develop past energy who.'),
(60, 16, 'Incomplete Info', '2023-09-19', '2023-09-23', 'Pressure western stand scientist movement fire will car.'),
(61, 28, 'Invalid ID', '2024-06-04', '2024-06-09', 'Could million life true.'),
(62, 93, 'Duplicate Record', '2024-03-11', '2024-03-13', 'Night head tough expert next tonight.'),
(63, 25, 'Duplicate Record', '2023-09-11', '2023-09-15', 'Later finish glass throughout health speak worry.'),
(64, 47, 'Incomplete Info', '2024-02-09', '2024-02-14', 'Within free feeling company western move pressure real.'),
(65, 2, 'Incomplete Info', '2023-11-08', '2023-11-13', 'Success give two air four eye city.'),
(66, 6, 'Data Mismatch', '2023-12-27', '2024-01-05', 'Member address mean future along local central.'),
(67, 38, 'Incomplete Info', '2024-05-31', '2024-06-11', 'Into stay morning born run.'),
(68, 97, 'Invalid ID', '2024-02-02', '2024-02-04', 'Human body really break able determine within.'),
(69, 2, 'Duplicate Record', '2024-02-25', '2024-03-04', 'Modern wide treat everything player hope crime dog.'),
(70, 62, 'Invalid ID', '2024-03-30', '2024-04-05', 'Standard change young three.'),
(71, 24, 'Data Mismatch', '2024-03-27', '2024-04-01', 'Black hot perhaps town.'),
(72, 62, 'Data Mismatch', '2024-05-05', '2024-05-19', 'East Republican message owner.'),
(73, 9, 'Invalid ID', '2024-03-10', '2024-03-18', 'Million along attention.'),
(74, 10, 'Data Mismatch', '2023-12-12', '2023-12-15', 'Fly spring as significant bill.'),
(75, 20, 'Duplicate Record', '2023-08-26', '2023-08-28', 'Give ahead save between box ten special.'),
(76, 32, 'Data Mismatch', '2024-05-30', '2024-06-08', 'Question artist season coach tonight.'),
(77, 98, 'Invalid ID', '2024-03-03', '2024-03-13', 'Item bag risk could political claim ten within.'),
(78, 77, 'Incomplete Info', '2024-04-25', '2024-05-08', 'Name although stand government very sport painting.'),
(79, 67, 'Invalid ID', '2024-06-12', '2024-06-20', 'Congress small Democrat health material after.'),
(80, 57, 'Duplicate Record', '2024-01-18', '2024-02-01', 'During wish well beyond back thousand.'),
(81, 76, 'Invalid ID', '2023-10-26', '2023-10-31', 'Structure bring Congress any share be effort rock.'),
(82, 73, 'Data Mismatch', '2024-03-15', '2024-03-25', 'Actually where join since bank trip cultural.'),
(83, 95, 'Data Mismatch', '2023-09-06', '2023-09-19', 'Foreign cold short it whether return cultural.'),
(84, 27, 'Incomplete Info', '2024-03-25', '2024-03-30', 'Southern strong soon prevent later often former.'),
(85, 85, 'Data Mismatch', '2024-04-26', '2024-04-29', 'News blood statement take institution believe who.'),
(86, 31, 'Incomplete Info', '2024-04-14', '2024-04-23', 'Resource answer travel.'),
(87, 10, 'Incomplete Info', '2023-09-20', '2023-09-21', 'Through travel throughout couple certainly show.'),
(88, 53, 'Invalid ID', '2024-01-30', '2024-02-11', 'Hot operation reason interest store speech side need.'),
(89, 77, 'Invalid ID', '2023-09-05', '2023-09-10', 'Others realize team.'),
(90, 5, 'Incomplete Info', '2024-06-19', '2024-06-24', 'Sister operation peace win.'),
(91, 91, 'Duplicate Record', '2023-10-21', '2023-11-02', 'Able carry small Mr.'),
(92, 59, 'Data Mismatch', '2024-02-22', '2024-03-04', 'Voice certain rich be evidence.'),
(93, 30, 'Duplicate Record', '2024-05-26', '2024-06-08', 'Close ahead matter man bit might happen.'),
(94, 81, 'Incomplete Info', '2024-02-20', '2024-02-27', 'Party wide respond view environment.'),
(95, 15, 'Incomplete Info', '2023-09-30', '2023-10-11', 'Evening second area.'),
(96, 20, 'Duplicate Record', '2023-10-03', '2023-10-17', 'College management main special.'),
(97, 19, 'Data Mismatch', '2023-08-01', '2023-08-02', 'Mission story strategy interview doctor.'),
(98, 22, 'Duplicate Record', '2023-10-23', '2023-11-02', 'Boy future agent account we threat box.'),
(99, 96, 'Duplicate Record', '2024-06-14', '2024-06-22', 'Follow Mrs on some movement everybody operation.'),
(100, 16, 'Invalid ID', '2024-02-23', '2024-03-06', 'Hour two back attorney brother west.')
;

INSERT INTO Audit_Log
(audit_id, user_id, action_type, table_affected, action_timestamp)
VALUES
 (1, 'auditor', 'DELETE', 'Audit_Log', '2025-06-21 17:46:46'),
 (2, 'system', 'LOGIN', 'Discrepancies', '2024-07-31 02:38:29'),
 (3, 'user01', 'LOGOUT', 'Members', '2024-10-16 20:43:01'),
 (4, 'auditor', 'DELETE', 'Audit_Log', '2025-01-31 19:20:48'),
 (5, 'admin', 'INSERT', 'Members', '2025-06-01 09:46:23'),
 (6, 'user02', 'LOGOUT', 'Audit_Log', '2024-08-23 11:42:59'),
 (7, 'user01', 'DELETE', 'Audit_Log', '2024-07-06 15:30:13'),
 (8, 'user01', 'UPDATE', 'Discrepancies', '2024-07-07 02:17:51'),
 (9, 'system', 'LOGIN', 'Plans', '2025-01-23 10:15:41'),
 (10, 'user02', 'LOGOUT', 'Discrepancies', '2025-03-27 16:16:11'),
 (11, 'auditor', 'INSERT', 'Discrepancies', '2024-09-22 21:39:14'),
 (12, 'admin', 'LOGIN', 'Plans', '2025-02-11 16:18:29'),
 (13, 'admin', 'INSERT', 'Enrollments', '2025-03-25 15:29:21'),
 (14, 'admin', 'LOGIN', 'Discrepancies', '2024-11-19 16:18:41'),
 (15, 'admin', 'LOGIN', 'Audit_Log', '2024-07-22 06:13:51'),
 (16, 'user01', 'LOGIN', 'Members', '2025-02-02 01:11:03'),
 (17, 'admin', 'DELETE', 'Plans', '2025-01-22 06:26:19'),
 (18, 'user01', 'LOGIN', 'Audit_Log', '2025-05-02 04:41:42'),
 (19, 'user01', 'LOGOUT', 'Discrepancies', '2024-08-06 20:05:21'),
 (20, 'auditor', 'INSERT', 'Enrollments', '2025-05-29 16:18:40'),
 (21, 'system', 'DELETE', 'Audit_Log', '2024-08-28 08:28:06'),
 (22, 'auditor', 'LOGIN', 'Members', '2024-11-24 16:21:41'),
 (23, 'user02', 'DELETE', 'Audit_Log', '2024-10-20 21:39:21'),
 (24, 'user02', 'DELETE', 'Discrepancies', '2025-01-29 11:37:50'),
 (25, 'auditor', 'INSERT', 'Members', '2025-03-06 13:50:10'),
 (26, 'system', 'UPDATE', 'Enrollments', '2024-10-31 05:00:08'),
 (27, 'admin', 'LOGOUT', 'Members', '2024-08-11 02:30:40'),
 (28, 'system', 'LOGIN', 'Members', '2024-11-07 19:01:36'),
 (29, 'user02', 'INSERT', 'Discrepancies', '2025-03-22 18:06:05'),
 (30, 'user01', 'UPDATE', 'Discrepancies', '2025-06-13 02:15:26'),
 (31, 'admin', 'LOGOUT', 'Plans', '2025-02-20 13:54:23'),
 (32, 'auditor', 'LOGIN', 'Discrepancies', '2024-08-31 03:02:40'),
 (33, 'user02', 'LOGIN', 'Audit_Log', '2024-08-22 10:30:15'),
 (34, 'user02', 'LOGIN', 'Enrollments', '2024-11-29 21:21:28'),
 (35, 'system', 'LOGOUT', 'Enrollments', '2024-08-31 04:17:10'),
 (36, 'user01', 'DELETE', 'Discrepancies', '2025-05-27 21:34:16'),
 (37, 'admin', 'LOGOUT', 'Plans', '2025-04-30 16:17:50'),
 (38, 'user01', 'DELETE', 'Plans', '2025-02-13 16:29:43'),
 (39, 'system', 'LOGOUT', 'Discrepancies', '2024-12-25 19:24:58'),
 (40, 'user02', 'LOGIN', 'Audit_Log', '2024-10-20 22:14:34'),
 (41, 'auditor', 'DELETE', 'Plans', '2025-02-01 21:17:17'),
 (42, 'system', 'LOGOUT', 'Discrepancies', '2024-12-09 22:14:14'),
 (43, 'auditor', 'DELETE', 'Enrollments', '2025-05-27 04:08:12'),
 (44, 'user02', 'LOGOUT', 'Discrepancies', '2025-02-24 04:00:29'),
 (45, 'user02', 'LOGIN', 'Members', '2025-02-01 01:05:05'),
 (46, 'admin', 'LOGIN', 'Discrepancies', '2025-01-11 12:13:31'),
 (47, 'auditor', 'UPDATE', 'Discrepancies', '2024-09-16 03:17:27'),
 (48, 'user01', 'UPDATE', 'Audit_Log', '2024-10-18 02:25:49'),
 (49, 'system', 'DELETE', 'Members', '2025-04-26 15:39:53'),
 (50, 'auditor', 'INSERT', 'Audit_Log', '2024-08-29 18:07:55'),
 (51, 'auditor', 'INSERT', 'Enrollments', '2025-02-10 09:20:50'),
 (52, 'auditor', 'UPDATE', 'Members', '2024-10-06 05:20:22'),
 (53, 'auditor', 'DELETE', 'Plans', '2025-05-09 13:19:21'),
 (54, 'system', 'LOGIN', 'Members', '2025-05-05 14:16:49'),
 (55, 'admin', 'LOGOUT', 'Discrepancies', '2025-04-17 17:56:26'),
 (56, 'admin', 'LOGIN', 'Audit_Log', '2025-01-03 01:09:53'),
 (57, 'user01', 'LOGOUT', 'Members', '2025-06-18 22:22:51'),
 (58, 'user02', 'DELETE', 'Enrollments', '2025-05-30 07:31:16'),
 (59, 'user01', 'LOGIN', 'Members', '2024-08-11 16:15:16'),
 (60, 'user01', 'LOGIN', 'Enrollments', '2025-04-06 01:59:56'),
 (61, 'admin', 'INSERT', 'Members', '2025-04-26 10:27:00'),
 (62, 'admin', 'INSERT', 'Plans', '2024-07-03 11:09:45'),
 (63, 'admin', 'DELETE', 'Discrepancies', '2025-06-05 16:05:40'),
 (64, 'user02', 'UPDATE', 'Audit_Log', '2025-04-24 15:38:29'),
 (65, 'auditor', 'LOGOUT', 'Enrollments', '2025-03-20 14:58:27'),
 (66, 'user02', 'UPDATE', 'Members', '2025-03-03 09:40:01'),
 (67, 'system', 'LOGIN', 'Audit_Log', '2025-02-14 01:08:17'),
 (68, 'user02', 'LOGIN', 'Audit_Log', '2024-10-24 11:51:18'),
 (69, 'user02', 'UPDATE', 'Discrepancies', '2024-09-13 08:29:00'),
 (70, 'admin', 'LOGIN', 'Plans', '2025-05-03 12:17:01'),
 (71, 'user01', 'LOGIN', 'Plans', '2024-08-07 02:10:19'),
 (72, 'system', 'UPDATE', 'Members', '2024-12-24 19:13:41'),
 (73, 'auditor', 'DELETE', 'Audit_Log', '2024-09-23 04:26:29'),
 (74, 'admin', 'LOGIN', 'Plans', '2025-05-02 13:22:31'),
 (75, 'auditor', 'DELETE', 'Enrollments', '2025-02-10 03:53:27'),
 (76, 'auditor', 'LOGIN', 'Members', '2024-08-10 07:46:15'),
 (77, 'user02', 'LOGIN', 'Audit_Log', '2024-11-17 18:21:01'),
 (78, 'admin', 'LOGOUT', 'Plans', '2024-07-06 11:30:36'),
 (79, 'admin', 'INSERT', 'Discrepancies', '2024-08-26 15:20:48'),
 (80, 'admin', 'INSERT', 'Audit_Log', '2024-08-31 19:35:42'),
 (81, 'user01', 'LOGOUT', 'Discrepancies', '2025-01-28 08:52:54'),
 (82, 'admin', 'UPDATE', 'Audit_Log', '2025-06-20 03:16:30'),
 (83, 'admin', 'UPDATE', 'Enrollments', '2024-09-26 22:03:30'),
 (84, 'system', 'DELETE', 'Enrollments', '2025-03-30 04:41:03'),
 (85, 'user01', 'INSERT', 'Plans', '2024-07-08 21:03:18'),
 (86, 'auditor', 'INSERT', 'Audit_Log', '2024-09-05 10:52:47'),
 (87, 'admin', 'UPDATE', 'Members', '2025-03-03 11:09:38'),
 (88, 'admin', 'DELETE', 'Discrepancies', '2025-03-28 00:40:36'),
 (89, 'user02', 'UPDATE', 'Enrollments', '2024-11-08 05:32:43'),
 (90, 'system', 'DELETE', 'Audit_Log', '2024-09-20 08:18:28'),
 (91, 'system', 'DELETE', 'Enrollments', '2024-11-03 14:31:58'),
 (92, 'admin', 'LOGIN', 'Plans', '2025-04-20 10:01:50'),
 (93, 'admin', 'INSERT', 'Discrepancies', '2024-09-06 10:52:21'),
 (94, 'user01', 'UPDATE', 'Enrollments', '2025-06-19 12:31:56'),
 (95, 'auditor', 'LOGOUT', 'Plans', '2024-08-29 20:37:04'),
 (96, 'user01', 'LOGIN', 'Members', '2024-07-19 20:54:41'),
 (97, 'admin', 'LOGOUT', 'Members', '2025-03-16 11:52:39'),
 (98, 'auditor', 'DELETE', 'Plans', '2024-08-04 13:41:32'),
 (99, 'system', 'LOGIN', 'Plans', '2025-05-15 00:32:14'),
 (100, 'user01', 'UPDATE', 'Discrepancies', '2025-06-14 19:35:05')
;

-- Discrepancy Analysis Queries
-- 1. Find members with multiple discrepancies:
SELECT m.member_id,
	CONCAT(m.first_name," " ,m.last_name) AS full_name,
	COUNT(d.discrepancy_id) AS total_issues
FROM members as m
JOIN enrollments as e
ON m.member_id =  e.member_id
JOIN discrepancies as d
ON e.enrollment_id = d.enrollment_id
GROUP BY m.member_id
HAVING COUNT(d.discrepancy_id)>1;

-- 2. Average resolution time:
SELECT AVG(DATEDIFF(resolved_on,reported_on)) AS avg_resolution_days
FROM discrepancies
WHERE resolved_on IS NOT NULL;

-- 3. Plans with high rejection rates:
SELECT p.plan_name,COUNT(*) AS total_counts ,
	sum(e.status = "Rejected") AS rejections ,
    ROUND(sum(e.status = "Rejected")*100/COUNT(*),2) AS rejection_rate
FROM plans as p
JOIN enrollments as e
ON p.plan_id = e.plan_id 
GROUP BY p.plan_name
ORDER BY rejection_rate DESC;

-- Other Method
SELECT p.plan_name,count(*) AS total_attempts,
	SUM(CASE WHEN e.status = "Rejected" THEN 1 ELSE 0 END) AS rejections ,
    ROUND(SUM(CASE WHEN e.status = "Rejected" THEN 1 ELSE 0 END) * 100/COUNT(*),2 ) AS rejection_rate
FROM plans as p
JOIN enrollments as e
ON p.plan_id = e.plan_id
GROUP BY p.plan_name
ORDER BY rejection_rate DESC ;

-- KPI Dashboard Queries
-- 4. Enrollment success rate:
SELECT ROUND(sum(status = "Enrolled" )*100/count(*),2) AS success_rate
FROM Enrollments;

SELECT ROUND(SUM(CASE WHEN status = 'Enrolled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
AS success_rate
FROM Enrollments;

-- 5. Rejection rate per plan:
SELECT p.plan_name,COUNT(*) AS total_counts ,
    ROUND(sum(e.status = "Rejected")*100/COUNT(*),2) AS rejection_rate
FROM plans as p
JOIN enrollments as e
ON p.plan_id = e.plan_id 
GROUP BY p.plan_name
ORDER BY rejection_rate DESC;

-- 6. Number of updates per associate:
SELECT user_id,COUNT(*) AS updates
FROM audit_log
WHERE action_type = "update"
GROUP BY user_id
ORDER BY updates DESC;

-- Audit Trail Analysis
-- 7. Actions by user/date:
SELECT user_id,DATE(action_timestamp) AS action_date ,
	COUNT(*) AS action_count
FROM audit_log
GROUP BY user_id,action_date
ORDER BY action_count DESC;

-- 8. Update frequency:
SELECT user_id,COUNT(*) AS updates
FROM audit_log
WHERE action_type = "UPDATE"
GROUP BY user_id
ORDER BY updates DESC;

-- 9. Detect unusual activity:
SELECT user_id,COUNT(*) AS actions,
	MIN(action_timestamp) AS first_action,
    MAX(action_timestamp) AS last_action
FROM audit_log
GROUP BY user_id 
HAVING actions > 25 OR last_action > now() - INTERVAL 1 DAY ; 

