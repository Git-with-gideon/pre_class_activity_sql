#create the tables for the student database
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    intake_year YEAR NOT NULL
);
