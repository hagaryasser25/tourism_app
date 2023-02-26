import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/screens/admin/add_place.dart';
import 'package:tourism_app/screens/admin/admin_home.dart';
import 'package:tourism_app/screens/admin/admin_places.dart';
import 'package:tourism_app/screens/admin/booking_list.dart';
import 'package:tourism_app/screens/auth/admin_login.dart';
import 'package:tourism_app/screens/auth/login_screen.dart';
import 'package:tourism_app/screens/auth/signup_screen.dart';
import 'package:tourism_app/screens/user/app_details.dart';
import 'package:tourism_app/screens/user/user_bookings.dart';
import 'package:tourism_app/screens/user/user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const UserLogin()
          : FirebaseAuth.instance.currentUser!.email == 'admin@gmail.com'
              ? const AdminHome()
              : UserHome(),
      routes: {
        SignupPage.routeName: (ctx) => SignupPage(),
        UserHome.routeName: (ctx) => UserHome(),
        UserLogin.routeName: (ctx) => UserLogin(),
        AdminHome.routeName: (ctx) => AdminHome(),
        AdminLogin.routeName: (ctx) => AdminLogin(),
        AddPlace.routeName: (ctx) => AddPlace(),
        AdminPlaces.routeName: (ctx) => AdminPlaces(),
        AppDetails.routeName: (ctx) => AppDetails(),
        UserBookings.routeName: (ctx) => UserBookings(),
        BookingList.routeName: (ctx) => BookingList(),
      },
    );
  }
}
