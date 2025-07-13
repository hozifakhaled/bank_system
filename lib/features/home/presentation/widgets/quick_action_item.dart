import 'package:flutter/material.dart';

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({
    super.key, required this.icon, required this.iconColor, required this.label,

  });
final IconData icon;
  final Color iconColor;
final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white, // لون موحّد مع الصفحة
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: iconColor, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
