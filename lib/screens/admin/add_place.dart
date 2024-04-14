import 'dart:io';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

import 'admin_home.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/addPlace';
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var foreignPriceController = TextEditingController();
  var governorateController = TextEditingController();
  var addressController = TextEditingController();
  var latitudeController = TextEditingController();
  var longitudeController = TextEditingController();
  var historyController = TextEditingController();
  String imageUrl = '';
  File? image;
  Future pickImageFromDevice() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return;
    final tempImage = File(xFile.path);
    setState(() {
      image = tempImage;
      print(image!.path);
    });

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference refrenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await refrenceImageToUpload.putFile(File(xFile.path));

      imageUrl = await refrenceImageToUpload.getDownloadURL();
    } catch (error) {}
    print(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'اضف بيانات الأماكن السياحية',
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600),
                      ),
                      Divider(
                        thickness: 0.80,
                        color: Colors.grey,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 30),
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundColor:
                                      Color.fromARGB(255, 254, 230, 159),
                                  backgroundImage:
                                      image == null ? null : FileImage(image!),
                                )),
                            Positioned(
                                top: 120,
                                left: 120,
                                child: SizedBox(
                                  width: 50,
                                  child: RawMaterialButton(
                                      // constraints: BoxConstraints.tight(const Size(45, 45)),
                                      elevation: 10,
                                      fillColor: Colors.amber,
                                      child: const Align(
                                          // ignore: unnecessary_const
                                          child: Icon(Icons.add_a_photo,
                                              color: Colors.white, size: 22)),
                                      padding: const EdgeInsets.all(15),
                                      shape: const CircleBorder(),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Choose option',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.amber)),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            pickImageFromDevice();
                                                          },
                                                          splashColor: HexColor(
                                                              '#FA8072'),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Icon(
                                                                    Icons.image,
                                                                    color: Colors
                                                                        .amber),
                                                              ),
                                                              Text('Gallery',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ))
                                                            ],
                                                          )),
                                                      InkWell(
                                                          onTap: () {
                                                            // pickImageFromCamera();
                                                          },
                                                          splashColor: HexColor(
                                                              '#FA8072'),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Icon(
                                                                    Icons
                                                                        .camera,
                                                                    color: Colors
                                                                        .amber),
                                                              ),
                                                              Text('Camera',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ))
                                                            ],
                                                          )),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          splashColor: HexColor(
                                                              '#FA8072'),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Icon(
                                                                    Icons
                                                                        .remove_circle,
                                                                    color: Colors
                                                                        .amber),
                                                              ),
                                                              Text('Remove',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ))
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      }),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                        child: TextField(
                          style: TextStyle(color: Colors.amber),
                          controller: nameController,
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
                            hintText: 'اسم المكان',
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
                            hintText: "سعر التذكرة للمصرى",
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
                          controller: foreignPriceController,
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
                            hintText: "سعر التذكرة للسائح",
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
                          controller: governorateController,
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
                            hintText: 'المحافظة',
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
                          controller: addressController,
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
                            hintText: 'العنوان',
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
                          controller: latitudeController,
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
                            hintText: 'خط العرض على الخرية',
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
                          controller: longitudeController,
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
                            hintText: 'خط الطول على الخريطة',
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
                        height: 200.h,
                        child: TextField(
                          style: TextStyle(color: Colors.amber),
                          keyboardType: TextInputType.multiline,
                          minLines: 10,
                          maxLines: 15,
                          controller: historyController,
                          decoration: InputDecoration(
                            fillColor: HexColor('#155564'),
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
                                  BorderSide(color: Colors.amber, width: 2.0),
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'تاريخ المكان',
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
                            String name = nameController.text.trim();
                            String price = priceController.text.trim();
                            String foreignPrice = foreignPriceController.text.trim();
                            String governorate =
                                governorateController.text.trim();
                            String address = addressController.text.trim();
                            String latitude = latitudeController.text.trim();
                            String longitude = longitudeController.text.trim();
                            String history = historyController.text.trim();

                            if (name.isEmpty ||
                                price.isEmpty ||
                                governorate.isEmpty ||
                                address.isEmpty ||
                                latitude.isEmpty ||
                                longitude.isEmpty ||
                                history.isEmpty ||
                                foreignPrice.isEmpty) {
                              CherryToast.info(
                                title: Text('ادخل جميع الحقول'),
                                actionHandler: () {},
                              ).show(context);
                              return;
                            }

                            User? user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              String uid = user.uid;
                              int date = DateTime.now().millisecondsSinceEpoch;

                              DatabaseReference companyRef = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child('touristPlaces');

                              String? id = companyRef.push().key;

                              await companyRef.child(id!).set({
                                'id': id,
                                'name': name,
                                'price': price,
                                'foreignPrice': foreignPrice,
                                'governorate': governorate,
                                'address': address,
                                'latitude': latitude,
                                'longitude': longitude,
                                'history': history,
                                'imageUrl': imageUrl,
                              });
                            }
                            showAlertDialog(context);
                          },
                          child: Text('أضافة',
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
    content: Text("تم أضافة المكان"),
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
