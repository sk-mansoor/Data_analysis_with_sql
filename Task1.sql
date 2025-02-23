

-- Create the Students table with relevant fields
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender ENUM('M', 'F') NOT NULL,
    Age INT,
    Grade VARCHAR(10),
    MathScore INT CHECK (MathScore BETWEEN 0 AND 100),
    ScienceScore INT CHECK (ScienceScore BETWEEN 0 AND 100),
    EnglishScore INT CHECK (EnglishScore BETWEEN 0 AND 100)
);

-- Insert sample student data
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
('Aryan Gupta', 'M', 19, 'A', 85, 90, 88),
('Meera Iyer', 'F', 18, 'B', 78, 84, 80),
('Karan Rao', 'M', 20, 'C', 65, 70, 68),
('Sneha Patel', 'F', 19, 'A', 90, 92, 94),
('Rohan Das', 'M', 18, 'B', 82, 86, 79),
('Priya Sharma', 'F', 20, 'A', 88, 89, 91),
('Vikram Singh', 'M', 21, 'C', 60, 65, 63),
('Ananya Verma', 'F', 19, 'B', 75, 80, 77),
('Devraj Nair', 'M', 20, 'A', 95, 94, 97),
('Nisha Reddy', 'F', 18, 'C', 68, 72, 70);

-- Retrieve all student records
SELECT * FROM Students;

-- Calculate the average score for each subject
SELECT 'Math' AS Subject, AVG(MathScore) AS Average_Score FROM Students
UNION
SELECT 'Science', AVG(ScienceScore) FROM Students
UNION
SELECT 'English', AVG(EnglishScore) FROM Students;

-- Identify the top performer based on total score
SELECT Name, (MathScore + ScienceScore + EnglishScore) AS TotalScore 
FROM Students 
ORDER BY TotalScore DESC 
LIMIT 1;

-- Count students in each grade
SELECT Grade, COUNT(*) AS StudentCount FROM Students GROUP BY Grade;

-- Compare average scores by gender
SELECT Gender, AVG(MathScore) AS Avg_Math, AVG(ScienceScore) AS Avg_Science, AVG(EnglishScore) AS Avg_English 
FROM Students 
GROUP BY Gender;

-- Identify students scoring above 80 in Math
SELECT Name, MathScore FROM Students WHERE MathScore > 80;

-- Update a student's grade
UPDATE Students SET Grade = 'B' WHERE StudentID = 3;
