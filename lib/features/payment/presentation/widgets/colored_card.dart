
import 'package:flutter/material.dart';

class CustomColoredCard extends StatelessWidget {
  const CustomColoredCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3B5AFB),
            Color(0xFF8A2BE2),
          ],
        ),
      ),
      child:const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
             children: [
               Icon(
                Icons.bolt, // أيقونة شبه اللي في التصميم
                color: Colors.white,
                                       ),
                                       Spacer(),
                                       Image(image: AssetImage('assets/images/Group 2.png'))
             ],
           ),
           SizedBox(height: 20),
           Text(
            '8629  9257  0928  3456',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w500,
            ),
          ),
           SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VALID THRU',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '09/24',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                'Arafat Alam',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
        Spacer(),
                Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}