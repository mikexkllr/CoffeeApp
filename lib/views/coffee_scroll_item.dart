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
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: this.isSelected ? Colors.brown : Colors.white54),
        ),
      ),
    );
  }
}
