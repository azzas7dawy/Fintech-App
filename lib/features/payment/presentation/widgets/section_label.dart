

import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:fintech_app/features/payment/presentation/widgets/currency_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  final Color color;

  const SectionLabel({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 13.sp),
    );
  }
}
