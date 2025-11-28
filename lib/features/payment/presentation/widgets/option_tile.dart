import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const OptionTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
