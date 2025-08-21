#create the tables for the student database
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    intake_year YEAR NOT NULL
);
# table for the linux grades
CREATE TABLE IF NOT EXISTS linux_grades (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    student_id INT,
    grade_obtained INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
# table for the python grades
CREATE TABLE IF NOT EXISTS python_grades (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    student_id INT,
    grade_obtained INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 2. Insert sample data into each table (at least 15 students)
-- Insert students
-- A mix of students who took one or both courses.
INSERT INTO students (student_id, student_name, intake_year) VALUES
(1, 'Alice', 2023),
(2, 'Bob', 2023),
(3, 'Charlie', 2023),
(4, 'David', 2023),
(5, 'Eva', 2023),
(6, 'Frank', 2023),
(7, 'Grace', 2024),
(8, 'Heidi', 2024),
(9, 'Ivan', 2024),
(10, 'Judy', 2024),
(11, 'Karl', 2024),
(12, 'Liam', 2025),
(13, 'Mia', 2025),
(14, 'Nora', 2025),
(15, 'Oscar', 2025);

-- Insert Linux grades (some students took this course)
INSERT INTO linux_grades (course_id, course_name, student_id, grade_obtained) VALUES
(101, 'Linux Basics', 1, 95), -- Alice (took both)
(102, 'Linux Basics', 2, 45), -- Bob (Linux only, less than 50)
(103, 'Linux Basics', 3, 78), -- Charlie (took both)
(104, 'Linux Basics', 4, 30), -- David (Linux only, less than 50)
(105, 'Linux Basics', 5, 85), -- Eva (took both)
(106, 'Linux Basics', 6, 60), -- Frank (took both)
(107, 'Linux Basics', 7, 55), -- Grace (Linux only)
(108, 'Linux Basics', 8, 48), -- Heidi (Linux only, less than 50)
(109, 'Linux Basics', 9, 91), -- Ivan (took both)
(110, 'Linux Basics', 11, 75); -- Karl (took both)

-- Insert Python grades (some students took this course)
INSERT INTO python_grades (course_id, course_name, student_id, grade_obtained) VALUES
(201, 'Python Programming', 1, 98), -- Alice (took both)
(202, 'Python Programming', 3, 82), -- Charlie (took both)
(203, 'Python Programming', 5, 88), -- Eva (took both)
(204, 'Python Programming', 6, 70), -- Frank (took both)
(205, 'Python Programming', 9, 89), -- Ivan (took both)
(206, 'Python Programming', 10, 65), -- Judy (Python only)
(207, 'Python Programming', 11, 80), -- Karl (took both)
(208, 'Python Programming', 12, 92), -- Liam (Python only)
(209, 'Python Programming', 13, 77), -- Mia (Python only)
(210, 'Python Programming', 14, 85); -- Nora (Python only)
