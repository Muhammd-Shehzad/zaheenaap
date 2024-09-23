import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewbuilder extends StatelessWidget {
  ListViewbuilder({
    super.key,
    this.image,
  });

  final image;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              child: Image.asset(image),
            ),
          ),
        );
      },
    );
  }
}
