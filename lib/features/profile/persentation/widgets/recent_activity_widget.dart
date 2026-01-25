import 'package:flutter/material.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                  offset: const Offset(0, 5))
            ],
          ),
          child: Column(
            children: const [
              ListTile(
                leading: Icon(Icons.arrow_upward, color: Colors.green),
                title: Text('Transfer to Ali'),
                subtitle: Text('Jan 23, 2026'),
                trailing: Text('-\$250'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.arrow_downward, color: Colors.blue),
                title: Text('Salary Deposit'),
                subtitle: Text('Jan 20, 2026'),
                trailing: Text('+\$1000'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
