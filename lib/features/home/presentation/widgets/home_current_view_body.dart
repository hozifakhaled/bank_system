import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/home/presentation/widgets/profile_in_home.dart';
import 'package:bank_system/features/home/presentation/widgets/quick_action_item.dart';
import 'package:bank_system/features/home/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCurrentViewBody extends StatelessWidget {
  const HomeCurrentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Profile
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: ColumnProfileHome(),
          ),
        ),

        // Quick Actions Title
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Quick Actions",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // Quick Actions List
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                // Replace data dynamically if needed
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: QuickActionItem(
                    icon: Icons.send,
                    label: "Transfer",
                    iconColor: maincolor,
                  ),
                );
              },
            ),
          ),
        ),

        // Recent Transactions Title
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // Recent Transactions List
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: TransactionItem(
                  title: "Monthly Salary",
                  date: "Yesterday • 9:00 AM",
                  amount: "+15,200.00 EGP",
                  amountColor: Colors.green,
                  icon: Icons.check_circle,
                  iconColor: Colors.green,
                ),
              );
            },
            childCount: 5,
          ),
        ),
      ],
    );
  }
}
