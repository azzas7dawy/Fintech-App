import 'package:flutter/material.dart';

Widget nestedCircles({
  required double big,
  required double mid,
  required double small,
}) {
  return SizedBox(
    width: big,
    height: big,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Big circle
        Container(
          width: big,
          height: big,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.05),
          ),
        ),

        // Mid circle
        Container(
          width: mid,
          height: mid,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.08),
          ),
        ),

        // Small circle
        Container(
          width: small,
          height: small,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.12),
          ),
        ),
      ],
    ),
  );
}
