import 'package:flutter/material.dart';

class QuickAccessBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickAccessBox({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Colors.black87),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
        ],
      ),
    );
  }
}