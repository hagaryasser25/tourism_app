import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism_app/screens/auth/login_screen.dart';
import 'package:tourism_app/screens/user/app_details.dart';
import 'package:tourism_app/screens/user/place_details.dart';
import 'package:tourism_app/screens/user/user_bookings.dart';

import '../models/places_model.dart';
import '../models/user_model.dart';

class UserHome extends StatefulWidget {
  static const routeName = '/userHome';
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Places> placesList = [];
  List<String> keyslist = [];
  late Users currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserData();
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

  getUserData() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database
        .reference()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid);

    final snapshot = await base.get();
    setState(() {
      currentUser = Users.fromSnapshot(snapshot);
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
              backgroundColor: Colors.black,
              title: Center(child: Text('???????????? ????????????????'))),
          drawer: Drawer(
            child: FutureBuilder(
              future: getUserData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (currentUser == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/logo.jfif'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("?????????????? ????????????????",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Theme.of(context).splashColor,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppDetails.routeName);
                                },
                                title: Text('???? ??????'),
                                leading: Icon(Icons.business_sharp),
                              ))),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Theme.of(context).splashColor,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, UserBookings.routeName);
                                },
                                title: Text('??????????????'),
                                leading: Icon(Icons.book),
                              ))),
                      Divider(
                        thickness: 0.8,
                        color: Colors.grey,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                        ),
                        title: const Text('?????? ????????????????'),
                        subtitle: Text('${currentUser.name}'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.email,
                        ),
                        title: const Text('???????????? ????????????????????'),
                        subtitle: Text('${currentUser.email}'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                        ),
                        title: const Text('?????? ????????????'),
                        subtitle: Text('${currentUser.phoneNumber}'),
                      ),
                      Divider(
                        thickness: 0.8,
                        color: Colors.grey,
                      ),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Theme.of(context).splashColor,
                              child: ListTile(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('??????????'),
                                          content: Text(
                                              '???? ?????? ?????????? ???? ?????????? ????????????'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                FirebaseAuth.instance.signOut();
                                                Navigator.pushNamed(context,
                                                    UserLogin.routeName);
                                              },
                                              child: Text('??????'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('????'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                title: Text('?????????? ????????????'),
                                leading: Icon(Icons.exit_to_app_rounded),
                              )))
                    ],
                  );
                }
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                Center(
                  child: Text(
                    '???????????? ???? ?????????????? ????????????????',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  child: Expanded(
                    flex: 8,
                    child: ListView.builder(
                        itemCount: placesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return PlaceDetails(
                                        name:
                                            '${placesList[index].name.toString()}',
                                        price:
                                            '${placesList[index].price.toString()}',
                                        governorate:
                                            '${placesList[index].governorate.toString()}',
                                        address:
                                            '${placesList[index].address.toString()}',
                                        history:
                                            '${placesList[index].history.toString()}',
                                        latitude:
                                            '${placesList[index].latitude.toString()}',
                                        longitude:
                                            '${placesList[index].longitude.toString()}',
                                        imageUrl:
                                            '${placesList[index].imageUrl.toString()}',
                                      );
                                    }));
                                  },
                                  child: Card(
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
                                                padding: EdgeInsets.only(
                                                    right: 15.w),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          )),
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
