import 'package:coffee_app/models/coffee_model.dart';
import 'package:coffee_app/models/coffee_type.dart';

List coffeeTypeList = [
  CoffeeTypeModel(
      title: "Cappuccino", isSelected: true, type: CoffeeType.cappuccino),
  CoffeeTypeModel(title: "Latte", isSelected: false, type: CoffeeType.latte),
  CoffeeTypeModel(title: "Black", isSelected: false, type: CoffeeType.black),
  CoffeeTypeModel(
      title: "Flat White", isSelected: false, type: CoffeeType.white),
  CoffeeTypeModel(title: "Tea", isSelected: false, type: CoffeeType.tea)
];

List coffeeList = [
  Coffee(
    title: "Cappuccino",
    subtitle: "With Almond Milk",
    price: 4.00,
    imagePath: "lib/assets/images/coffee1.jpg",
    type: CoffeeType.latte,
  ),
  Coffee(
    title: "Latte",
    subtitle: "With milk and sugar",
    price: 4.00,
    imagePath: "lib/assets/images/coffee2.jpg",
    type: CoffeeType.latte,
  ),
  Coffee(
    title: "Black",
    subtitle: "Just pure hard coffee",
    price: 4.00,
    imagePath: "lib/assets/images/coffee3.jpg",
    type: CoffeeType.latte,
  ),
  Coffee(
    title: "Flat White",
    subtitle: "With Milk",
    price: 4.00,
    imagePath: "lib/assets/images/coffee4.jpg",
    type: CoffeeType.white,
  ),
];
