import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            right: -size.width * 0.14,
            top: size.width * 0.0,
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              child: Image(image: AssetImage('assets/images/Ellipse 52.png')),
            ),
          ),
        ],
      ),
    );
  }
}
