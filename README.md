# ALU Rwanda Student Performance Database

## Overview
A MySQL database system to track and analyze student grades for Linux and Python courses at ALU Rwanda.

## Database Structure

### Tables
1. **`students`** - student_id, student_name, intake_year
2. **`linux_grades`** - course_id, course_name, student_id, grade_obtained
3. **`python_grades`** - course_id, course_name, student_id, grade_obtained

### Sample Data
- 15 students (2023-2025 intake years)
- 10 Linux enrollments, 10 Python enrollments
- Mixed enrollment: some students took one course, others took both

## Queries Implemented

1. **Data Insertion** - 15 students with course grades
2. **Failed Linux Students** - Students scoring < 50% in Linux (3 students)
3. **Single Course Students** - Students taking only Linux OR Python (8 students)
4. **Dual Course Students** - Students taking both courses (6 students)  
5. **Course Averages** - Linux: 66.4%, Python: 82.6%
6. **Top Performer** - Alice (highest overall average)

## SQL Techniques Used
- INNER/LEFT JOINs
- UNION operations
- Subqueries
- EXCEPT operator
- Aggregate functions
- Foreign key constraints

## How to Run

1. **Setup MySQL**
   ```bash
   mysql -u root -p
   ```

2. **Execute SQL file**
   ```sql
   source student_performance.sql;
   ```

3. **Verify**
   ```sql
   USE student_performance;
   SELECT COUNT(*) FROM students;
   ```

Key Results
Linux failure rate: 30% (3/10 students below 50%)
Python success rate: 100% (all students passed)
Course engagement: 60% of students enrolled in courses
Top performer: Alice with 96.5% average across both courses

Files
student_performance.sql - Complete database implementation
README.md - This documentation
