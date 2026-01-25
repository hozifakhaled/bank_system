import 'package:bank_system/features/home/presentation/widgets/profile_in_home.dart';
import 'package:flutter/material.dart';
import 'quick_action.dart';
import 'transaction_item.dart';

class HomeCurrentViewBody extends StatelessWidget {
  const HomeCurrentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ColumnProfileHome(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Quick Actions",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: QuickActions(), // بدون Bloc، يمكن وضع dummy list داخل QuickActions
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              "Recent Transactions",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: TransactionItem(
                title: "Monthly Salary",
                date: "Yesterday • 9:00 AM",
                amount: "+15,200.00 EGP",
                amountColor: Colors.green,
                icon: Icons.check_circle,
                iconColor: Colors.green,
              ),
            ),
            childCount: 5,
          ),
        ),
      ],
    );
  }
}
