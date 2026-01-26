import 'package:bank_system/features/islamicaccount/presentation/pages/islamic_account_page.dart';
import 'package:flutter/material.dart';

class IslamicServicesSection extends StatelessWidget {
  const IslamicServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Islamic Services",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: const [
            IslamicServiceItem(icon: Icons.calculate, label: "Zakat"),
            IslamicServiceItem(icon: Icons.volunteer_activism, label: "Charity"),
            IslamicServiceItem(icon: Icons.mosque, label: "Hajj Saving"),
            IslamicServiceItem(icon: Icons.show_chart, label: "Sukuk"),
            IslamicServiceItem(icon: Icons.verified, label: "Halal Report"),
            IslamicServiceItem(icon: Icons.security, label: "Sharia Audit"),
          ],
        ),
      ],
    );
  }
}

class IslamicServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const IslamicServiceItem(
      {super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: mainColor, size: 28),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}