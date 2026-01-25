import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';

class RecentTransfersWidget extends StatelessWidget {
  const RecentTransfersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Transfers',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: maincolor,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text('Ahmed'),
                subtitle: Text('12345678'),
                trailing: Text('\$500'),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: maincolor,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text('Ali'),
                subtitle: Text('87654321'),
                trailing: Text('\$250'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
