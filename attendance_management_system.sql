-- =========================================
-- Attendance Management System (DBMS Project)
-- =========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS attendance_system;
USE attendance_system;

-- =========================================
-- TABLE CREATION
-- =========================================

-- CLASS TABLE
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL
);

-- STUDENTS TABLE
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- TEACHER TABLE
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- SUBJECT TABLE
CREATE TABLE subject (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

-- ATTENDANCE TABLE
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    date DATE,
    status ENUM('Present','Absent') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

-- =========================================
-- INSERT SAMPLE DATA
-- =========================================

-- Insert Classes
INSERT INTO class (class_name) VALUES
('BCA 1st Year'),
('BCA 2nd Year'),
('BSc IT 1st Year'),
('BSc IT 2nd Year'),
('BTech 2nd Year');

-- Insert Teachers
INSERT INTO teacher (name) VALUES
('Amit Sharma'),
('Neha Verma'),
('Raj Malhotra');

-- Insert Subjects
INSERT INTO subject (subject_name, teacher_id) VALUES
('Database Management', 1),
('Operating System', 2),
('Computer Networks', 3),
('Mathematics', 1),
('Software Engineering', 2);

-- Insert Students
INSERT INTO students (name, email, class_id) VALUES
('Rahul Kumar', 'rahul1@gmail.com', 1),
('Priya Singh', 'priya1@gmail.com', 1),
('Aman Gupta', 'aman1@gmail.com', 1),
('Riya Sharma', 'riya2@gmail.com', 2),
('Karan Mehta', 'karan2@gmail.com', 2),
('Simran Kaur', 'simran2@gmail.com', 2),
('Arjun Patel', 'arjun3@gmail.com', 3),
('Sneha Roy', 'sneha3@gmail.com', 3),
('Vikas Yadav', 'vikas3@gmail.com', 3),
('Anjali Verma', 'anjali4@gmail.com', 4),
('Rohit Saini', 'rohit4@gmail.com', 4),
('Pooja Nair', 'pooja4@gmail.com', 4),
('Deepak Chauhan', 'deepak5@gmail.com', 5),
('Meera Joshi', 'meera5@gmail.com', 5),
('Nitin Arora', 'nitin5@gmail.com', 5);

-- Insert Attendance Records
INSERT INTO attendance (student_id, subject_id, date, status) VALUES
(1,1,'2026-02-01','Present'),
(2,1,'2026-02-01','Absent'),
(3,1,'2026-02-01','Present'),
(4,2,'2026-02-01','Present'),
(5,2,'2026-02-01','Absent'),
(6,2,'2026-02-01','Present'),
(7,3,'2026-02-02','Present'),
(8,3,'2026-02-02','Present'),
(9,3,'2026-02-02','Absent'),
(10,4,'2026-02-02','Present'),
(11,4,'2026-02-02','Present'),
(12,4,'2026-02-02','Absent'),
(13,5,'2026-02-03','Present'),
(14,5,'2026-02-03','Absent'),
(15,5,'2026-02-03','Present');

-- =========================================
-- IMPORTANT QUERIES
-- =========================================

-- 1️⃣ Full Attendance Report
SELECT s.name AS student_name,
       sub.subject_name,
       a.date,
       a.status
FROM attendance a
JOIN students s ON a.student_id = s.student_id
JOIN subject sub ON a.subject_id = sub.subject_id
ORDER BY s.name;

-- 2️⃣ Attendance Percentage Per Student
SELECT s.name,
ROUND((SUM(a.status='Present') / COUNT(*)) * 100,2) AS attendance_percentage
FROM attendance a
JOIN students s ON a.student_id = s.student_id
GROUP BY s.student_id;

-- 3️⃣ Students Below 75% Attendance
SELECT s.name,
ROUND((SUM(a.status='Present') / COUNT(*)) * 100,2) AS percentage
FROM attendance a
JOIN students s ON a.student_id = s.student_id
GROUP BY s.student_id
HAVING percentage < 75;

-- 4️⃣ Total Students Per Class
SELECT c.class_name,
COUNT(s.student_id) AS total_students
FROM students s
JOIN class c ON s.class_id = c.class_id
GROUP BY c.class_id;

-- 5️⃣ Subjects Assigned To Teachers
SELECT t.name AS teacher_name,
sub.subject_name
FROM subject sub
JOIN teacher t ON sub.teacher_id = t.teacher_id;

-- 6️⃣ Students with Class Name
SELECT s.name AS student_name,
       c.class_name
FROM students s
JOIN class c ON s.class_id = c.class_id;

-- 7️⃣ Total Present and Absent Count
SELECT status,
COUNT(*) AS total
FROM attendance
GROUP BY status;

-- 8️⃣ Attendance of Specific Student (Rahul Kumar)
SELECT s.name,
       sub.subject_name,
       a.date,
       a.status
FROM attendance a
JOIN students s ON a.student_id = s.student_id
JOIN subject sub ON a.subject_id = sub.subject_id
WHERE s.name = 'Rahul Kumar';

-- 9️⃣ Students Who Were Absent
SELECT s.name,
       sub.subject_name,
       a.date
FROM attendance a
JOIN students s ON a.student_id = s.student_id
JOIN subject sub ON a.subject_id = sub.subject_id
WHERE a.status = 'Absent';

-- 🔟 Number of Subjects per Teacher
SELECT t.name AS teacher_name,
COUNT(sub.subject_id) AS total_subjects
FROM teacher t
JOIN subject sub ON t.teacher_id = sub.teacher_id
GROUP BY t.teacher_id;
