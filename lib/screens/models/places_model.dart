import 'package:flutter/cupertino.dart';

class Places {
  Places({
    String? id,
    String? address,
    String? governorate,
    String? history,
    String? imageUrl,
    String? latitude,
    String? longitude,
    String? name,
    String? price,
  }) {
    _id = id;
    _address = address;
    _governorate = governorate;
    _history = history;
    _imageUrl = imageUrl;
    _latitude = latitude;
    _longitude = longitude;
    _name = name;
    _price = price;
  }

  Places.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _governorate = json['governorate'];
    _history = json['history'];
    _imageUrl = json['imageUrl'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _name = json['name'];
    _price = json['price'];
  }

  String? _id;
  String? _address;
  String? _governorate;
  String? _history;
  String? _imageUrl;
  String? _latitude;
  String? _longitude;
  String? _name;
  String? _price;

  String? get id => _id;
  String? get address => _address;
  String? get governorate => _governorate;
  String? get history => _history;
  String? get imageUrl => _imageUrl;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get name => _name;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['governorate'] = _governorate;
    map['history'] = _history;
    map['imageUrl'] = _imageUrl;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['name'] = _name;
    map['price'] = _price;

    return map;
  }
}
