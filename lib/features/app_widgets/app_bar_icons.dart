import 'package:flutter/material.dart';

class AppBarIconWidget extends StatelessWidget {
  const AppBarIconWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            icon,
            color: Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}
