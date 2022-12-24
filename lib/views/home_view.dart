import 'dart:ffi';

import 'package:coffee_app/models/coffee_type.dart';
import 'package:coffee_app/views/coffee_scroll_item.dart';
import 'package:coffee_app/views/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/models/mock_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CoffeeType selectedCoffeeType = CoffeeType.all;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Find the best\ncoffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(height: 25),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
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
            padding: EdgeInsets.symmetric(vertical: 15.0),
            height: 50,
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
          Expanded(
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
      bottomNavigationBar: BottomNavigationBar(
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
}
