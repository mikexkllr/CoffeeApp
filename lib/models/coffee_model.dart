import 'package:coffee_app/models/coffee_type.dart';

class CoffeeTypeModel {
  String title;
  CoffeeType type;

  // this is a constructor lol
  CoffeeTypeModel({
    required this.title,
    required this.type,
  });
}

class Coffee {
  String title;
  String subtitle;
  double price;
  String imagePath;
  CoffeeType type;

  Coffee({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.type,
  });
}
