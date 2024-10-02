import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewbuilder extends StatefulWidget {
  ListViewbuilder({
    super.key,
    required this.images,
    required this.names,
    required this.length,
  });

  final List<dynamic> images;
  final List<dynamic> names;
  final int length;

  @override
  State<ListViewbuilder> createState() => _ListViewbuilderState();
}

class _ListViewbuilderState extends State<ListViewbuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.h,
                  width: 300.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.images[index],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.names[index],
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
