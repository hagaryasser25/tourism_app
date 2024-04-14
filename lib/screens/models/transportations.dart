import 'package:flutter/cupertino.dart';

class Transportations {
  Transportations({
    String? id,
    String? type,
    String? description,
    String? price,
  }) {
    _id = id;
    _type = type;
    _description = description;
    _price = price;
  }

  Transportations.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _price = json['price'];
    _description = json['description'];
  }

  String? _id;
  String? _type;
  String? _price;
  String? _description;

  String? get id => _id;
  String? get type => _type;
  String? get price => _price;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['price'] = _price;
    map['description'] = _description;

    return map;
  }
}
