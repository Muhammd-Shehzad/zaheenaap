import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListviewText extends StatelessWidget {
  ListviewText({
    super.key,
    this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
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
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
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
    );
  }
}
