-- This creates our database to store student information and grades
CREATE DATABASE IF NOT EXISTS student_performance;
USE student_performance;

-- Step 1: Let's create the tables we need
-- This table will hold basic info about each student
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    intake_year YEAR NOT NULL
);

-- This table will store all the Linux course grades
CREATE TABLE IF NOT EXISTS linux_grades (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    student_id INT,
    grade_obtained INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- This table will store all the Python course grades
CREATE TABLE IF NOT EXISTS python_grades (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    student_id INT,
    grade_obtained INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Step 2: Now let's add some sample data to our tables
-- First, we'll add 15 students with their names and when they started
-- Some students took both courses, some took only one
INSERT INTO students (student_id, student_name, intake_year) VALUES
(1, 'Umwiza', 2023),
(2, 'John', 2023),
(3, 'Kwizera', 2023),
(4, 'Sarah', 2023),
(5, 'Mukantwari', 2023),
(6, 'Michael', 2023),
(7, 'Uwimana', 2024),
(8, 'Emma', 2024),
(9, 'Ndayisaba', 2024),
(10, 'David', 2024),
(11, 'Mugisha', 2024),
(12, 'Iradukunda', 2025),
(13, 'James', 2025),
(14, 'Mukamurenzi', 2025),
(15, 'Sophie', 2025);

-- Now let's add the Linux course grades
-- The comments show which students took both courses vs only Linux
INSERT INTO linux_grades (course_id, course_name, student_id, grade_obtained) VALUES
(101, 'Linux Basics', 1, 95),  -- Umwiza (took both courses)
(102, 'Linux Basics', 2, 45),  -- John (only took Linux, failed with less than 50%)
(103, 'Linux Basics', 3, 78),  -- Kwizera (took both courses)
(104, 'Linux Basics', 4, 30),  -- Sarah (only took Linux, failed with less than 50%)
(105, 'Linux Basics', 5, 85),  -- Mukantwari (took both courses)
(106, 'Linux Basics', 6, 60),  -- Michael (took both courses)
(107, 'Linux Basics', 7, 55),  -- Uwimana (only took Linux)
(108, 'Linux Basics', 8, 48),  -- Emma (only took Linux, failed with less than 50%)
(109, 'Linux Basics', 9, 91),  -- Ndayisaba (took both courses)
(110, 'Linux Basics', 11, 75); -- Mugisha (took both courses)

-- Now let's add the Python course grades
-- The comments show which students took both courses vs only Python
INSERT INTO python_grades (course_id, course_name, student_id, grade_obtained) VALUES
(201, 'Python Programming', 1, 98),  -- Umwiza (took both courses)
(202, 'Python Programming', 3, 82),  -- Kwizera (took both courses)
(203, 'Python Programming', 5, 88),  -- Mukantwari (took both courses)
(204, 'Python Programming', 6, 70),  -- Michael (took both courses)
(205, 'Python Programming', 9, 89),  -- Ndayisaba (took both courses)
(206, 'Python Programming', 10, 65), -- David (only took Python)
(207, 'Python Programming', 11, 80), -- Mugisha (took both courses)
(208, 'Python Programming', 12, 92), -- Iradukunda (only took Python)
(209, 'Python Programming', 13, 77), -- James (only took Python)
(210, 'Python Programming', 14, 85); -- Mukamurenzi (only took Python)

-- Question 3: Who failed the Linux course? (scored less than 50%)
-- This query finds all students who got a failing grade in Linux
SELECT
    s.student_name
FROM
    students s
JOIN
    linux_grades lg ON s.student_id = lg.student_id
WHERE
    lg.grade_obtained < 50;

-- Question 4: Who took only one course (not both)?
-- This finds students who took either Linux OR Python, but not both courses
SELECT student_name
FROM students
WHERE student_id IN (
    -- Students who took only Linux (not Python)
    SELECT student_id
    FROM linux_grades
    EXCEPT
    SELECT student_id
    FROM python_grades
)
UNION
SELECT student_name
FROM students
WHERE student_id IN (
    -- Students who took only Python (not Linux)
    SELECT student_id
    FROM python_grades
    EXCEPT
    SELECT student_id
    FROM linux_grades
);
-- Question 5: Who took both courses?
-- This finds students who took BOTH Linux AND Python courses
-- 5. Find students who took both courses
SELECT
    s.student_name
FROM
    students s
JOIN
    linux_grades lg ON s.student_id = lg.student_id
JOIN
    python_grades pg ON s.student_id = pg.student_id;

-- 6. Calculate the average grade per course (Linux and Python separately)
-- Average grade for Linux
SELECT
    'Linux' AS course,
    AVG(grade_obtained) AS average_grade
FROM
    linux_grades
UNION ALL
-- Average grade for Python
SELECT
    'Python' AS course,
    AVG(grade_obtained) AS average_grade
FROM
    python_grades;

-- Question 7: Who is the best student overall?
-- This finds the student with the highest average grade across both courses
SELECT
    s.student_name,
    AVG(combined_grades.grade) AS average_overall_grade
FROM
    students s
JOIN (
    -- We combine all grades from both courses for each student
    SELECT student_id, grade_obtained AS grade FROM linux_grades
    UNION ALL
    SELECT student_id, grade_obtained AS grade FROM python_grades
) AS combined_grades ON s.student_id = combined_grades.student_id
GROUP BY
    s.student_name
ORDER BY
    average_overall_grade DESC
LIMIT 1;
