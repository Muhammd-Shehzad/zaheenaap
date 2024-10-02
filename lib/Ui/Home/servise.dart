import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Servise extends StatefulWidget {
  const Servise({
    super.key,
  });

  @override
  State<Servise> createState() => _ServiseState();
}

class _ServiseState extends State<Servise> {
  List<String> names = [];
  List<String> imageUrls = [];

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://api.zaheen.com.pk/api/fetchByTableName/1/1'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        names = List<String>.from(data.map((item) => item['fullname']));
        imageUrls = List<String>.from(data.map((item) => item['thumbnailUrl']));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 150.h,
                  width: 300.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      imageUrls[
                          index], // Use Image.network to load images from API
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  names[index], // Use names from API data
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
