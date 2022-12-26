import 'package:coffee_app/generics/coffee_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoffeeScrollItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTapCallback;
  const CoffeeScrollItem(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapCallback();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      this.isSelected ? CoffeeColors.orange : Colors.white54),
            ),
            SizedBox(
              height: 5.0,
            ),
            if (isSelected)
              Container(
                height: 5.0,
                width: 5.0,
                decoration: new BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
