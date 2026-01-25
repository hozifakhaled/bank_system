import 'package:bank_system/features/home/presentation/widgets/quick_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'icon': Icons.account_balance_wallet, 'label': 'Wallet'},
      {'icon': Icons.send, 'label': 'Transfer'},
      {'icon': Icons.receipt_long, 'label': 'Bills'},
      {'icon': Icons.credit_card, 'label': 'Cards'},
      {'icon': Icons.savings, 'label': 'Savings'},
    ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: QuickActionItem(
              icon: actions[index]['icon'] as IconData,
              label: actions[index]['label'] as String,
            ),
          );
        },
      ),
    );
  }
}
