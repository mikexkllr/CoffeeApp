import 'package:coffee_app/models/coffee_model.dart';
import 'package:coffee_app/models/coffee_type.dart';

List coffeeTypeList = [
  CoffeeTypeModel(title: "All", type: CoffeeType.all),
  CoffeeTypeModel(title: "Cappuccino", type: CoffeeType.cappuccino),
  CoffeeTypeModel(title: "Latte", type: CoffeeType.latte),
  CoffeeTypeModel(title: "Black", type: CoffeeType.black),
  CoffeeTypeModel(title: "Flat White", type: CoffeeType.white),
  CoffeeTypeModel(title: "Tea", type: CoffeeType.tea)
];

List<Coffee> coffeeListMock = [
  Coffee(
    title: "Cappuccino",
    subtitle: "With Almond Milk",
    price: 4.00,
    imagePath: "lib/assets/images/coffee1.jpg",
    type: CoffeeType.cappuccino,
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
    type: CoffeeType.black,
  ),
  Coffee(
    title: "Flat White",
    subtitle: "With Milk",
    price: 4.00,
    imagePath: "lib/assets/images/coffee4.jpg",
    type: CoffeeType.white,
  ),
];
