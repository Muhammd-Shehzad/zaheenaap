import 'package:flutter/material.dart';

class SkillCourseScreen extends StatefulWidget {
  const SkillCourseScreen({super.key});

  @override
  State<SkillCourseScreen> createState() => _SkillCourseScreenState();
}

class _SkillCourseScreenState extends State<SkillCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skill Course Screen'),
      ),
    );
  }
}
