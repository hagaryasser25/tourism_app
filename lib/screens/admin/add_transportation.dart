import 'dart:io';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:tourism_app/screens/admin/admin_home.dart';
import 'package:tourism_app/screens/user/user_home.dart';

class AddTransportation extends StatefulWidget {
  String place;
  static const routeName = '/addPlace';
  AddTransportation({required this.place});

  @override
  State<AddTransportation> createState() => _AddTransportationState();
}

class _AddTransportationState extends State<AddTransportation> {
  var typeController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 70.h),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/logo.jfif'),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 65.h,
                        child: TextField(
                          style: TextStyle(color: Colors.amber),
                          controller: typeController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.amber,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.amber),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "نوع المواصلات",
                            hintStyle: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: TextField(
                          style: TextStyle(color: Colors.amber),
                          controller: descriptionController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.amber,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.amber),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "الوصف",
                            hintStyle: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: TextField(
                          style: TextStyle(color: Colors.amber),
                          controller: priceController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.amber,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.amber),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "السعر",
                            hintStyle: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: double.infinity, height: 65.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                          ),
                          onPressed: () async {
                            String type = typeController.text.trim();
                            String description =
                                descriptionController.text.trim();
                            String price = priceController.text.trim();

                            if (type.isEmpty ||
                                description.isEmpty ||
                                price.isEmpty ) {
                              CherryToast.info(
                                title: Text('ادخل جميع الحقول'),
                                actionHandler: () {},
                              ).show(context);
                              return;
                            }

                            User? user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              String uid = user.uid;

                              DatabaseReference companyRef = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child('transportations').child(widget.place);

                              String? id = companyRef.push().key;

                              await companyRef.child(id!).set({
                                'id': id,
                                'type': type,
                                'description': description,
                                'price': price,
                              });
                            }
                            showAlertDialog(context);
                          },
                          child: Text("أضافة",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Widget remindButton = TextButton(
    style: TextButton.styleFrom(
      primary: HexColor('#6bbcba'),
    ),
    child: Text("Ok"),
    onPressed: () {
      Navigator.pushNamed(context, AdminHome.routeName);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text("تم الاضافة"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
