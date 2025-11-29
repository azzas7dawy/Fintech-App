import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class DividerStatics extends StatelessWidget {
  const DividerStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: context.divider, height: 1);
  }
}
