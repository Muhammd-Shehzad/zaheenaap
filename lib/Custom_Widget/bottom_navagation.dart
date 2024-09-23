import 'package:flutter/material.dart';
import 'package:zaheenaap/Ui/Board/board_screen.dart';
import 'package:zaheenaap/Ui/Course/course_screen.dart';
import 'package:zaheenaap/Ui/Home/home_screen.dart';
import 'package:zaheenaap/Ui/Skill_Courses/skill_course_screen.dart';
import 'package:zaheenaap/Ui/profile/profile_screen.dart';

class BottomNavagation extends StatefulWidget {
  const BottomNavagation({super.key});

  @override
  State<BottomNavagation> createState() => _BottomNavagationState();
}

class _BottomNavagationState extends State<BottomNavagation> {
  int myIndex = 0;

  List pages = [
    HomeScreen(),
    BoardScreen(),
    CourseScreen(),
    SkillCourseScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            myIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Board'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Skill Course'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Profile'),
        ],
      ),
      body: pages[myIndex],
    );
  }
}
