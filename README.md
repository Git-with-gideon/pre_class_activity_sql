# Student Performance Database Project

## Overview
This project is a solution to the "Pre-Class Activity: Student Performance Database" assignment for ALU Rwanda students. The objective is to design and implement a simple database to track and analyze student grades from Linux and Python courses.

The project uses **MySQL** and consists of a single `.sql` file that handles the entire database setup, data insertion, and query implementation as specified in the assignment prompt.

## File Structure
The project contains one main file:
- `student_performance_database.sql`: This file contains all the SQL commands for creating the database and tables, inserting sample data, and executing the required analytical queries.

## Database Schema
The database, named `student_performance`, includes three tables:

1.  `students`: Stores student information.
    - `student_id` (PRIMARY KEY)
    - `student_name`
    - `intake_year`

2.  `linux_grades`: Stores grades for the Linux course.
    - `course_id` (PRIMARY KEY)
    - `course_name`
    - `student_id` (FOREIGN KEY)
    - `grade_obtained`

3.  `python_grades`: Stores grades for the Python course.
    - `course_id` (PRIMARY KEY)
    - `course_name`
    - `student_id` (FOREIGN KEY)
    - `grade_obtained`

## Queries Implemented
The `student_performance_database.sql` file includes the following queries in sequential order:

1.  **Data Insertion**: Populates the tables with sample data for at least 15 students.
2.  **Students with Low Linux Grades**: Identifies students who scored less than 50% in the Linux course.
3.  **Students with One Course**: Finds students who took either the Linux or Python course, but not both.
4.  **Students with Both Courses**: Identifies students who are enrolled in both courses.
5.  **Average Grades**: Calculates the average grade for both the Linux and Python courses separately.
6.  **Top-Performing Student**: Determines the student with the highest average grade across both courses.

## How to Run the Queries
To execute the queries, you can use a MySQL client or a command-line tool.

1.  **Open MySQL Client**: Launch your MySQL environment.
2.  **Execute the File**: Source the `.sql` file using the following command:
    ```bash
    mysql -u [your_username] -p < student_performance_database.sql
    ```
    Alternatively, you can copy and paste the entire script into your MySQL client and run it.

## Author
This project was developed by Group Coding Lab 23.
