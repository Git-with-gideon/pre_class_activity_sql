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