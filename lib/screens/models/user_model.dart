import 'package:firebase_database/firebase_database.dart';

class Users {
  String? email;
  String? uid;
  String? phoneNumber;
  String? name;
  String? dt;
  String? nationality;

  Users({this.email, this.uid, this.phoneNumber, this.name, this.dt, this.nationality});

  Users.fromSnapshot(DataSnapshot dataSnapshot) {
    uid = (dataSnapshot.child("uid").value.toString());
    email = (dataSnapshot.child("email").value.toString());
    name = (dataSnapshot.child("name").value.toString());
    phoneNumber = (dataSnapshot.child("phoneNumber").value.toString());
    dt = (dataSnapshot.child("dt").value.toString());
    nationality = (dataSnapshot.child("nationality").value.toString());
  }
}
