import 'dart:ffi';

import 'package:coffee_app/generics/coffee_colors.dart';
import 'package:coffee_app/models/coffee_type.dart';
import 'package:coffee_app/views/coffee_scroll_item.dart';
import 'package:coffee_app/views/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/models/mock_data.dart';

import '../models/coffee_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CoffeeType selectedCoffeeType = CoffeeType.all;
  List<Coffee> coffeeList = [];

  @override
  void initState() {
    this.coffeeList = coffeeListMock;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            // Find the best coffee for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Find the best\ncoffee for you",
                style: GoogleFonts.poppins(
                  fontSize: 36,
                ),
              ),
            ),
            SizedBox(height: 25),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onChanged: (value) {
                  searchForCoffee(value);
                },
                decoration: InputDecoration(
                  focusColor: CoffeeColors.orange,
                  hoverColor: CoffeeColors.orange,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Find your coffee..",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),

            Container(
              height: 75.0,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeTypeList.length,
                itemBuilder: (context, index) {
                  return CoffeeScrollItem(
                    title: coffeeTypeList[index].title,
                    isSelected:
                        this.selectedCoffeeType == coffeeTypeList[index].type,
                    onTapCallback: () {
                      selectCoffeeType(coffeeTypeList[index].type);
                    },
                  );
                },
              ),
            ),

            // horizontal list view of coffee tiles
            Container(
              height: 370,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  if (selectedCoffeeType == CoffeeType.all ||
                      selectedCoffeeType == coffeeList[index].type) {
                    return CoffeeTile(coffee: coffeeList[index]);
                  }

                  return Container();
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: CoffeeColors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
    );
  }

  selectCoffeeType(CoffeeType coffeeType) {
    setState(() {
      this.selectedCoffeeType = coffeeType;
    });
  }

  searchForCoffee(String searchTerm) {
    if (searchTerm.isEmpty) {
      coffeeList = coffeeListMock;
    }

    setState(() {
      coffeeList = coffeeListMock
          .where((element) =>
              element.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }
}
