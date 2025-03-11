# Alumni Connect

## 📌 Project Overview
Alumni Connect is a web-based platform designed to facilitate communication and networking between alumni and current students. It includes job referral features, alumni verification through document uploads, and access control for certain features based on alumni verification status.

## 🚀 Features

### ✅ Implemented Features
- **User Authentication**: Secure login and registration for alumni, students, and administrators.
- **Job Referral System**: Alumni can post job opportunities for students and other alumni.
- **Alumni Verification**: Alumni must upload documents for verification before accessing certain features.
- **Feature Restrictions**: Unverified alumni cannot upload images to the gallery or post jobs.
- **Alumni Profile Management**: Alumni can update their profiles with details such as work experience, achievements, and expertise.
- **Gallery Section**: Alumni can upload and share images from past events and reunions.
- **Event Management**: Allows administrators to post upcoming alumni meetups and events.

### ❌ Not Yet Implemented
- **Chat Feature**: A direct communication feature for networking is planned but not yet implemented.

## 🛠️ Technologies Used
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Backend**: Java, JSP, Servlet
- **Database**: MySQL

## 📂 Database Schema
### Tables
1. **Users Table**: Stores alumni and student details.
2. **Gallery Table**: Stores images uploaded by verified alumni.
3. **Jobs Table**: Stores job postings by verified alumni.
4. **Events Table**: Stores College Event details.
5. **Admin Table**: Stores admin details.

## 🔧 Setup Instructions
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/alumni-connect.git
   ```
2. Import the database schema into MySQL.
3. Configure database credentials in the backend files.
4. Deploy the application on a Tomcat server.

## 📌 Future Enhancements
- Implement a real-time chat feature.
- Improve UI/UX for better user experience.
- Add event management for alumni gatherings.

## 🤝 Contribution
Feel free to contribute by creating pull requests or suggesting new features!

## 📜 License
This project is open-source and available under the [MIT License](LICENSE).
