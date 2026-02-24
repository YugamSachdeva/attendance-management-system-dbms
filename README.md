# 📌 Attendance Management System (DBMS Project)

## 👨‍💻 Project Overview

This project implements an Attendance Management System using MySQL as part of a DBMS academic project.  
It demonstrates database design, table creation, primary and foreign key constraints, and SQL queries for attendance analysis.

The system follows relational database principles and includes an ER Diagram designed using traditional Chen notation.

---

## 🗂 Repository Structure

attendance-management-system-dbms/
│

├── ER_Diagram.png  
├── README.md  
├── attendance_management_system.sql  
└── screenshots/  

---

## 🏗 Database Schema

The system consists of five main entities:

1. Class  
2. Students  
3. Teacher  
4. Subject  
5. Attendance  

Each table is connected using proper foreign key relationships to maintain referential integrity.

---

## 🔗 Entity Relationships

- One Class has many Students (1:M)  
- One Teacher teaches many Subjects (1:M)  
- One Student has many Attendance records (1:M)  
- One Subject has many Attendance records (1:M)  

Attendance acts as an associative entity between Students and Subjects.

---

## 🛠 Technologies Used

- MySQL  
- SQL  
- ER Diagram (Chen Notation)  
- GitHub  

---

## 📊 Features Implemented

- Database creation  
- Table creation with Primary Keys and Foreign Keys  
- Sample data insertion  
- Attendance recording  
- Full attendance report using JOIN  
- Attendance percentage calculation  
- Students below 75% attendance query  
- Class-wise student count  
- Subject-teacher mapping  

---


## ▶ How to Run the Project

1. Install MySQL or use XAMPP.
2. Open MySQL Command Line.
3. Import the SQL file:

   attendance_management_system.sql

4. Execute the queries included in the file.
5. View results in the console.

---

## 🎓 Academic Concepts Demonstrated

- Database normalization  
- Referential integrity  
- One-to-Many relationships  
- SQL JOIN operations  
- Aggregate functions (COUNT, SUM, GROUP BY)  
- HAVING clause usage  
- Foreign key constraints  

---

## 👤 Author

Yugam Sachdeva  
DBMS Project  
Attendance Management System
