import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future callApi() async {
    var res = await http.get(
      Uri.https('api.zaheen.com.pk', 'api/fetchByTableName/2/1'),
    );
    print(res.body);
  }

  @override
  void setState(VoidCallback fn) {
    callApi();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
    );
  }
}
