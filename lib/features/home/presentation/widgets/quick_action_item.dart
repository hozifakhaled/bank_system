import 'package:flutter/material.dart';

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final String icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    final String fullImageUrl = "http://10.0.2.2:8080$icon"; // ⬅️ حل المشكلة

    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.network(
            fullImageUrl,
            width: 20,
            height: 20,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
