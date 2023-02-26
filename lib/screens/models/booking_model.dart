import 'package:flutter/cupertino.dart';

class Booking {
  Booking({
    String? id,
    String? name,
    String? amount,
    String? place,
    String? phoneNumber,
    String? date,
    String? uid,
  }) {
    _id = id;
    _name = name;
    _amount = amount;
    _place = place;
    _phoneNumber = phoneNumber;
    _date = date;
    _uid = uid;
  }

  Booking.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _place = json['place'];
    _amount = json['amount'];
    _phoneNumber = json['phoneNumber'];
    _date = json['date'];
    _uid = json['uid'];
  }

  String? _id;
  String? _name;
  String? _place;
  String? _amount;
  String? _phoneNumber;
  String? _date;
  String? _uid;

  String? get id => _id;
  String? get name => _name;
  String? get place => _place;
  String? get amount => _amount;
  String? get phoneNumber => _phoneNumber;
  String? get date => _date;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['place'] = _place;
    map['amount'] = _amount;
    map['phoneNumber'] = _phoneNumber;
    map['date'] = _date;
    map['uid'] = _uid;

    return map;
  }
}
