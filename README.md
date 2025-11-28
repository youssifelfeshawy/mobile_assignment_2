# Course Enrollment App

## Overview

This is a simple mobile application for managing and enrolling in courses. It uses Firebase for backend services, including authentication (email/password) and Cloud Firestore for storing course data, user enrollments, and user information. The app allows users to register, log in, view available courses, enroll in them, and (potentially for admins) add new courses. The UI appears to be built with a framework like Flutter, featuring a clean, minimalistic design with purple accents.

The app demonstrates basic CRUD operations on courses and user interactions, with real-time updates via Firestore. It's likely a prototype or assignment project, as indicated by placeholder data like "course" and "course description."

## Features

- **User Authentication**: Secure registration and login using email and password via Firebase Authentication.
- **Course Listing**: Displays available courses with names, descriptions, and an "Enroll" button.
- **Enrollment**: Users can enroll in courses, with a success message displayed upon completion. Enrollments are tracked in Firestore.
- **Add New Course**: A screen to create new courses by entering a name and description.
- **Firebase Integration**: 
  - Authentication console shows user details (e.g., UID, creation/sign-in dates).
  - Firestore database with collections for `courses`, `enrollments`, and `users`.
- **Real-Time Feedback**: Snackbar-style messages for actions like successful enrollment.

## Screenshots

### Login Screen
![Login Screen](https://i.imgur.com/placeholder-login.png)  
The login page with fields for email and password, plus a link to register.

### Register Screen
![Register Screen](https://i.imgur.com/placeholder-register.png)  
The registration page with fields for name, email, and password, plus a link to login.

### Available Courses Screen
![Available Courses Screen](https://i.imgur.com/placeholder-available-courses.png)  
List of courses with enroll buttons and a success message at the bottom after enrollment.

### Add New Course Screen
![Add New Course Screen](https://i.imgur.com/placeholder-add-course.png)  
Form to add a new course with name and description fields.

### Firebase Authentication Console
![Firebase Auth Console](https://i.imgur.com/placeholder-firebase-auth.png)  
Shows authenticated users, including creation and sign-in timestamps.

### Firebase Database Console
![Firebase DB Console](https://i.imgur.com/placeholder-firebase-db.png)  
Firestore structure with collections and sample course document.

## Tech Stack

- **Frontend**: Likely Flutter or a similar cross-platform framework (based on UI elements like rounded buttons and material design).
- **Backend**: Google Firebase
  - Authentication: Email/Password provider.
  - Database: Cloud Firestore (NoSQL) with collections for courses, enrollments, and users.
- **Other**: Potential use of Firebase Dynamic Links (noted in the auth console warning).

## Setup and Installation

1. **Clone the Repository**:
   ```
   git clone https://github.com/your-repo/course-enrollment-app.git
   cd course-enrollment-app
   ```

2. **Install Dependencies**:
   Assuming Flutter:
   ```
   flutter pub get
   ```

3. **Configure Firebase**:
   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com).
   - Enable Authentication (Email/Password).
   - Enable Cloud Firestore.
   - Download `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) and place in the app directory.
   - Update Firestore rules for security (e.g., allow read/write only for authenticated users).

4. **Run the App**:
   ```
   flutter run
   ```

## Database Structure

- **courses** collection:
  - Document ID: Auto-generated.
  - Fields: `name` (string), `description` (string).

- **enrollments** collection:
  - Tracks user-course relationships (e.g., user UID and course ID).

- **users** collection:
  - Stores user details like name, email.

## Usage

- Register or log in with credentials (e.g., youssef@gmail.com).
- View and enroll in courses from the "Available Courses" screen.
- Add new courses via the "+" button (if implemented with admin checks).
---
