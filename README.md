Alumni Connect

📌 Project Overview

Alumni Connect is a web-based platform designed to bridge the gap between alumni and current students. The system provides various features such as job referrals, alumni verification via document upload, and access restrictions for unverified alumni.

🛠️ Features

✅ Implemented Features:

Job Referral System: Alumni can post job opportunities to help fellow alumni and students.

Alumni Verification: Users can upload verification documents for authentication.

Feature Restrictions: Unverified alumni have limited access (e.g., restricted from posting jobs or uploading images to the gallery).

🚧 Pending Features:

Chat Feature: Not implemented yet but planned for future updates.

💻 Technologies Used

Backend: Java, JSP, Servlets

Frontend: HTML, CSS, JavaScript, Bootstrap

Database: MySQL

📂 Database Schema (Main Tables)

users Table

Column Name

Data Type

Description

user_id

INT (PK)

Unique identifier for users

name

VARCHAR

User's full name

email

VARCHAR

User's email (unique)

password

VARCHAR

Hashed password

role

ENUM

Role (e.g., 'alumni', 'student', 'admin')

verified

BOOLEAN

Status of alumni verification

jobs Table

Column Name

Data Type

Description

job_id

INT (PK)

Unique identifier for job posts

alumni_id

INT (FK)

References users(user_id)

job_title

VARCHAR

Title of the job

company

VARCHAR

Company name

location

VARCHAR

Job location

description

TEXT

Job description

posted_date

DATE

Date of job posting

gallery Table

Column Name

Data Type

Description

image_id

INT (PK)

Unique identifier for gallery images

alumni_id

INT (FK)

References users(user_id)

image_url

VARCHAR

Link to uploaded image

description

TEXT

Description of the image

uploaded_at

TIMESTAMP

Timestamp of upload

🚀 How to Run the Project

Prerequisites

Java Development Kit (JDK)

Apache Tomcat Server

MySQL Database

Steps to Set Up

Clone the repository:

git clone https://github.com/your-repo/alumni-connect.git

Import the project into an IDE (Eclipse/IntelliJ).

Configure the database.properties file with your MySQL credentials.

Run the SQL scripts to create the necessary tables.

Deploy the project on Tomcat.

Access the web app via http://localhost:8080/AlumniConnect.

📌 Future Enhancements

Implement a real-time chat feature for alumni and students.

Add an event management module for alumni networking.

Enhance UI with better UX and mobile responsiveness.

📝 License

This project is open-source and available under the MIT License.

Made with ❤️ by Sunny Gupta
