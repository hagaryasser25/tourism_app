import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/places_model.dart';

class AdminPlaces extends StatefulWidget {
  static const routeName = '/adminPlaces';
  const AdminPlaces({super.key});

  @override
  State<AdminPlaces> createState() => _AdminPlacesState();
}

class _AdminPlacesState extends State<AdminPlaces> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Places> placesList = [];
  List<String> keyslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchPlaces();
  }

  @override
  void fetchPlaces() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("touristPlaces");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      Places p = Places.fromJson(event.snapshot.value);
      placesList.add(p);
      keyslist.add(event.snapshot.key.toString());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black, title: Text('الأماكن السياحية')),
          body: Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                right: 10.w,
                left: 10.w,
              ),
              child: ListView.builder(
                  itemCount: placesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, bottom: 10),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 15.w),
                                        child: Image.network(
                                            '${placesList[index].imageUrl.toString()}'),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        '${placesList[index].name.toString()}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        super.widget));
                                            base
                                                .child(placesList[index]
                                                    .id
                                                    .toString())
                                                .remove();
                                          },
                                          child: Icon(Icons.delete,
                                              color: Colors.white))
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
