import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:zaheenaap/Custom_Widget/list_view_builder.dart';
import 'package:zaheenaap/Custom_Widget/list_view_text.dart';
import 'package:zaheenaap/Ui/Home/servise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  List<String> sliderImages = [
    'assets/banner/img1.jpg',
    'assets/banner/img2.jpg',
    'assets/banner/img3.jpg'
  ];
  List<String> skillImages = [
    'assets/skilled/graphicdesign.png',
    'assets/skilled/applicationdev.png',
    'assets/skilled/webdev.png'
  ];

  List<String> skillNames = [
    'Website Development',
    'Application Development',
    'Graphic Designing'
  ];

  List<String> names1 = [];
  List<String> imageUrls2 = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://api.zaheen.com.pk/api/fetchByTableName/2/1'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        names1 = List<String>.from(data.map((item) => item['name']));
        imageUrls2 =
            List<String>.from(data.map((item) => item['thumbnailUrl']));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 160.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(blurRadius: 0.1, spreadRadius: 0.0),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/profile.jpg'),
                            ),
                          ),
                          Text(
                            'Hello , Shehzad',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Find a course you want to learn',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 45.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFFDEBEB), // Light Pink (top)
                              Color(0xFFE1D7F3), // Light Purple
                              Color(0xFFB0D0FF), // Light Blue (bottom)
                            ],
                          ),
                        ),
                        child: TextField(
                          onTap: () {},
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.search_rounded),
                            suffixIcon:
                                InkWell(onTap: () {}, child: Icon(Icons.clear)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    items: sliderImages
                        .map(
                          (item) => ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        )
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: sliderImages.asMap().entries.map((entry) {
                    return InkWell(
                      onTap: () =>
                          CarouselSliderController().animateToPage(entry.key),
                      child: Container(
                        width: current == entry.key ? 17 : 7,
                        height: 5.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          color:
                              current == entry.key ? Colors.black : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                ListviewText(text: 'Board'),
                SizedBox(
                  height: 10.h,
                ),
                Servise(),
                SizedBox(
                  height: 10.h,
                ),
                ListviewText(text: 'Courses'),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: names1.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100.h,
                              width: 100.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageUrls2[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              names1[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListviewText(text: 'Skill Courses'),
                SizedBox(
                  height: 10.h,
                ),
                ListViewbuilder(
                  names: skillNames,
                  images: skillImages,
                  length: skillImages.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
