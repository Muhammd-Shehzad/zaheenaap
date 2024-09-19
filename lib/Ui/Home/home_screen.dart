import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheenaap/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> sliderImages = [
    'assets/banner/img1.jpg',
    'assets/banner/img2.jpg',
    'assets/banner/img3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 150.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                            padding: const EdgeInsets.all(18.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/profile.jpg'),
                            ),
                          ),
                          Text(
                            'Hello , Shehzad',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Find a course you want to learn'),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 15),
                    child: Container(
                      height: 200.h,
                      child: PageView.builder(
                        itemCount: sliderImages.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded corners
                            child: Image.asset(
                              sliderImages[index],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100.h,
                          width: 150.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                'assets/skilled/applicationdev.png'),
                          ),
                        ),
                      );
                    },
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
