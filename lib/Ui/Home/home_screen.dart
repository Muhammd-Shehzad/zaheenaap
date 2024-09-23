import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:zaheenaap/Custom_Widget/list_view_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  List<String> sliderImages = [
    'assets/banner/img1.jpg',
    'assets/banner/img2.jpg',
    'assets/banner/img3.jpg'
  ];

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 230, 230),
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
                  padding: const EdgeInsets.all(18.0),
                  child: CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: sliderImages.length,
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        height: 200.h,
                        width: 300.w,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20.0), // Rounded corners
                          child: Image.asset(
                            sliderImages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
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
                      onTap: () => CarouselSliderController().animateToPage,
                      child: Container(
                        width: 12.0, // Indicator width
                        height: 12.0, // Indicator height
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == entry.key
                              ? Color.fromRGBO(
                                  0, 0, 0, 0.9) // Active indicator color
                              : Color.fromRGBO(
                                  0, 0, 0, 0.4), // Inactive indicator color
                        ),
                      ),
                    );
                  }).toList(), // Ensure to convert the map results to a list
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Boards',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.sp),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 150.h,
                  child: ListViewbuilder(image: 'assets/banner/img1.jpg'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Courses',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.sp),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 120.h,
                              width: 120.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'assets/skilled/applicationdev.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text('hellowords'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 150.h,
                  child: ListViewbuilder(image: 'assets/banner/img1.jpg'),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
