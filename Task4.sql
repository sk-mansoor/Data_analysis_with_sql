-- Create the Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT,
    TotalScore INT GENERATED ALWAYS AS (MathScore + ScienceScore + EnglishScore) STORED
);

-- Insert Sample Data
INSERT INTO Students (StudentID, Name, MathScore, ScienceScore, EnglishScore) VALUES
(101, 'Arjun Kumar', 85, 90, 78),
(102, 'Priya Sharma', 72, 80, 88),
(103, 'Ravi Patel', 65, 70, 72),
(104, 'Ananya Desai', 95, 92, 94),
(105, 'Manish Verma', 88, 85, 91),
(106, 'Neha Gupta', 76, 80, 79),
(107, 'Vikram Rao', 90, 89, 84),
(108, 'Kavya Nair', 77, 83, 80),
(109, 'Ishaan Mehta', 92, 93, 89),
(110, 'Sanya Patel', 65, 70, 73);

-- Select Students with Specific Fields
SELECT 
    StudentID, 
    Name, 
    MathScore, 
    TotalScore 
FROM Students;

-- Rank Students Based on Total Scores
SELECT 
    StudentID, 
    Name, 
    TotalScore,
    RANK() OVER (ORDER BY TotalScore DESC) AS RankPosition
FROM Students;

-- Calculate Running Totals for Math Scores
SELECT 
    StudentID, 
    Name, 
    MathScore,
    SUM(MathScore) OVER (ORDER BY StudentID) AS RunningTotal
FROM Students;


