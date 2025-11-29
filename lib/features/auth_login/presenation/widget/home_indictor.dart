import 'package:flutter/material.dart';

class HomeIndicator extends StatelessWidget {
  final Color color;

  const HomeIndicator({
    super.key,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 5,
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}