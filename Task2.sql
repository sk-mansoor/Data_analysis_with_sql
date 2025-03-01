-- Create Students Table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Courses Table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT
);

-- Create Enrolments Table
CREATE TABLE IF NOT EXISTS Enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Insert Sample Data
INSERT INTO Students (name, email) VALUES
('Aarav Kapoor', 'aarav.kapoor@example.com'),
('Neha Sharma', 'neha.sharma@example.com'),
('Rohan Mehta', 'rohan.mehta@example.com'),
('Ishita Verma', 'ishita.verma@example.com'),
('Kunal Joshi', 'kunal.joshi@example.com');

INSERT INTO Courses (course_name, course_description) VALUES
('Data Structures', 'Learn about arrays, linked lists, trees, and graphs'),
('Database Management', 'Fundamentals of relational databases and SQL'),
('Web Development', 'HTML, CSS, JavaScript, and backend frameworks'),
('Cybersecurity Basics', 'Network security, cryptography, and ethical hacking');

INSERT INTO Enrolments (student_id, course_id, enrolment_date) VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-01-12'),
(2, 2, '2024-01-15'),
(2, 3, '2024-01-18'),
(3, 1, '2024-01-20'),
(4, 4, '2024-01-22');

-- List all students and the courses they are enrolled in
SELECT s.name AS Student_Name, c.course_name AS Course_Name
FROM Students s
INNER JOIN Enrolments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- Find the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS Student_Count
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- List students who have enrolled in more than one course
SELECT s.name AS Student_Name, COUNT(e.course_id) AS Courses_Enrolled
FROM Students s
INNER JOIN Enrolments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 1;

-- Find courses with no enrolled students
SELECT c.course_name 
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.enrolment_id IS NULL;
