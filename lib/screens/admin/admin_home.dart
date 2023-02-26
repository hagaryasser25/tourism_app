import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism_app/screens/admin/add_place.dart';
import 'package:tourism_app/screens/admin/admin_places.dart';
import 'package:tourism_app/screens/admin/booking_list.dart';
import 'package:tourism_app/screens/auth/login_screen.dart';

class AdminHome extends StatefulWidget {
  static const routeName = '/adminHome';
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          body: Column(
            children: [
              Image.asset('assets/images/admin.jfif'),
              Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                ),
                child: Row(
                  children: [
                    ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 170.w, height: 50.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // <-- Radius
                            ),
                          ),
                          child: Text(
                            'اضف أماكن سياحية',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AddPlace.routeName);
                          },
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 172.w, height: 50.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // <-- Radius
                            ),
                          ),
                          child: Text(
                            'قائمة الأماكن السياحية',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AdminPlaces.routeName);
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                ),
                child: Row(
                  children: [
                    ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 170.w, height: 50.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // <-- Radius
                            ),
                          ),
                          child: Text(
                            'قائمة الحجوزات',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, BookingList.routeName);
                          },
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 170.w, height: 50.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // <-- Radius
                            ),
                          ),
                          child: Text(
                            'خروج',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('تأكيد'),
                                    content:
                                        Text('هل انت متأكد من تسجيل الخروج'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.pushNamed(
                                              context, UserLogin.routeName);
                                        },
                                        child: Text('نعم'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('لا'),
                                      ),
                                    ],
                                  );
                                });
                          },
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
