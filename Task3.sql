
-- Create Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    math_score INT NOT NULL,
    science_score INT NOT NULL,
    english_score INT NOT NULL
);

-- Insert Sample Data
INSERT INTO Students (name, math_score, science_score, english_score) VALUES
('Aryan Gupta', 85, 90, 88),
('Meera Iyer', 78, 84, 80),
('Karan Rao', 65, 70, 68),
('Sneha Patel', 90, 92, 94),
('Rohan Das', 82, 86, 79),
('Priya Sharma', 88, 89, 91),
('Vikram Singh', 60, 65, 63),
('Ananya Reddy', 95, 93, 92),
('Rahul Jain', 78, 82, 80),
('Ishita Nair', 85, 87, 88);

--  Identify Top Students by Total Scores
SELECT name, 
       (math_score + science_score + english_score) AS total_score
FROM Students
ORDER BY total_score DESC
LIMIT 5;

--  Calculate Averages Based on Specific Conditions
-- Average score of students who scored above 70 in Math
SELECT AVG(math_score) AS average_math_score
FROM Students
WHERE math_score > 70;

-- Average total score of students grouped by score range
SELECT 
    CASE 
        WHEN (math_score + science_score + english_score) BETWEEN 200 AND 250 THEN '200-250'
        WHEN (math_score + science_score + english_score) BETWEEN 150 AND 200 THEN '150-200'
        ELSE 'Below 150'
    END AS score_range,
    AVG(math_score + science_score + english_score) AS average_total_score
FROM Students
GROUP BY score_range;

-- Find the Second-Highest Math Score
SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);

-- Calculate Total Score for Each Student
SELECT name, 
       (math_score + science_score + english_score) AS total_score
FROM Students;

-- Rank Students Without LIMIT
SELECT name, 
       (math_score + science_score + english_score) AS total_score,
       RANK() OVER (ORDER BY (math_score + science_score + english_score) DESC) AS student_rank
FROM Students;
