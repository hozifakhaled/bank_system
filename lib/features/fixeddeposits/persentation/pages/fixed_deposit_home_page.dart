import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/fixeddeposits/persentation/widgets/fixed_dposit_plan_card.dart'  hide maincolor;
import 'package:flutter/material.dart';

class FixedDepositHomePage extends StatelessWidget {
  const FixedDepositHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text('Fixed Deposit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Balance: \$5000',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // FD Plans
            const FDPlanCardWidget(
                duration: '6 Months', interest: '5%', minAmount: '\$100'),
            const FDPlanCardWidget(
                duration: '1 Year', interest: '6%', minAmount: '\$500'),
            const FDPlanCardWidget(
                duration: '2 Years', interest: '7%', minAmount: '\$1000'),

            const SizedBox(height: 24),

            // Recent FDs
            const Text(
              'Your Fixed Deposits',
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
                    leading: Icon(Icons.lock, color: maincolor),
                    title: Text('1 Year FD'),
                    subtitle: Text('Start: Jan 1, 2026'),
                    trailing: Text('\$1000'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock, color: maincolor),
                    title: Text('6 Months FD'),
                    subtitle: Text('Start: Feb 15, 2026'),
                    trailing: Text('\$500'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}








