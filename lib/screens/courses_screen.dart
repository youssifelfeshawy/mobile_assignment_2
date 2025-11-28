// lib/screens/courses_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_course_screen.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Stream<QuerySnapshot> _getCourses() {
    return _firestore.collection('courses').snapshots();
  }

  Future<void> _enrollInCourse(String courseId) async {
    // Assuming enrollments are stored in a subcollection or separate collection.
    // Here, using a separate 'enrollments' collection for simplicity.
    await _firestore.collection('enrollments').add({
      'userId': uid,
      'courseId': courseId,
      'enrolledAt': Timestamp.now(),
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Enrolled successfully!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Courses'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCourseScreen()),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getCourses(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final courses = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course['name']),
                subtitle: Text(course['description'] ?? ''),
                trailing: ElevatedButton(
                  onPressed: () => _enrollInCourse(course.id),
                  child: Text('Enroll'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
