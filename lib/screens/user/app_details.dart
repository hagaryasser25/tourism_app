import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism_app/screens/user/user_home.dart';

class AppDetails extends StatefulWidget {
  static const routeName = '/appDetails';
  const AppDetails({super.key});

  @override
  State<AppDetails> createState() => _AppDetailsState();
}

class _AppDetailsState extends State<AppDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
            appBar:
                AppBar(backgroundColor: Colors.black, title: Text('من نحن')),
            body: Padding(
              padding: EdgeInsets.only(top: 60.h, right: 10.w),
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image(
                        image: AssetImage('assets/images/tourism.gif'),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'دليل سياحى هى منصة عربية توفر مجموعة كبيرة من الأماكن السياحية فى مختلف الأنحاء وتسعى الى رفع مستوى زيارات السائحين الى الأماكن السياحية',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  SizedBox(height: 30.h),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UserHome.routeName);
                      },
                      child: Text(
                        'عودة الى الصفحة الرئيسية',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
