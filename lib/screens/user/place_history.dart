import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceHistory extends StatefulWidget {
  String imageUrl;
  String history;
  String name;
  PlaceHistory(
      {required this.imageUrl, required this.history, required this.name});

  @override
  State<PlaceHistory> createState() => _PlaceHistoryState();
}

class _PlaceHistoryState extends State<PlaceHistory> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black, title: Text('${widget.name}')),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network('${widget.imageUrl}'),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '${widget.history}',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Cairo',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
