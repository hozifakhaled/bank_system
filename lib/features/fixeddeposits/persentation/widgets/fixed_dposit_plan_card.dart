import 'dart:developer';

import 'package:flutter/material.dart';

const maincolor = Color(0xFF6366F1);

class FDPlanCardWidget extends StatelessWidget {
  final String duration;
  final String interest;
  final String minAmount;

  const FDPlanCardWidget({
    super.key,
    required this.duration,
    required this.interest,
    required this.minAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(duration,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Interest: $interest',
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
              Text('Min Amount: $minAmount',
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _showOpenFDModal(context, duration, interest, minAmount);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: maincolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Open FD', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

void _showOpenFDModal(BuildContext context, String duration, String interest, String minAmount) {
  TextEditingController amountController = TextEditingController();

  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
            left: 24, right: 24, top: 24, bottom: MediaQuery.of(context).viewInsets.bottom + 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Open FD - $duration',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Interest Rate: $interest', style: const TextStyle(fontSize: 16)),
            Text('Minimum Amount: $minAmount', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // هنا تضيف عملية إنشاء FD
                  log('FD Opened: ${amountController.text} for $duration');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: maincolor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Confirm FD',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
