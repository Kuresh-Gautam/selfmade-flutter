import 'package:flutter/foundation.dart';

class SP {
  final String name;
  final int panno;
  final String slug;
  final String image;
  final String location;

  SP(
      {@required this.name,
      @required this.panno,
      @required this.slug,
      @required this.image,
      @required this.location});

  factory SP.fromJson(Map<String, dynamic> json) {
    print(json);
    return SP(
        name: json['name'],
        panno: int.parse(json['panno']),
        slug: json['slug'],
        image: json['image'],
        location: json['location']);
  }
}
