import 'package:bank_system/features/deposits/presentation/pages/deposit_view.dart';
import 'package:bank_system/features/home/presentation/widgets/account_overview.dart';
import 'package:bank_system/features/profile/persentation/pages/profile_page.dart';
import 'package:bank_system/features/tranferation/persentation/pages/transfer_view.dart';
import 'package:bank_system/features/withdraws/presentation/pages/withdraw_view.dart';
import 'package:flutter/material.dart';

const maincolor = Color(0xFF6366F1);
const unSelectedColor = Color(0xFF9CA3AF);

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AccountOverviewPage(),                  // Home
    TransferView(),
    DepositView(),   
     WithdrawHomePage(),               // Deposit
      ProfilePage(),                     // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 78,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(child: _buildNavItem(Icons.home_rounded, 'Home', 0)),
            Expanded(child: _buildNavItem(Icons.send_rounded, 'Transfer', 1)),
            Expanded(child: _buildNavItem(Icons.account_balance_wallet_rounded, 'Deposit', 2)),
            Expanded(child: _buildNavItem(Icons.money_off_rounded, 'Withdraw', 3)),
            Expanded(child: _buildNavItem(Icons.person_rounded, 'Profile', 4)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        constraints: const BoxConstraints(maxHeight: 70),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: isSelected ? maincolor.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? maincolor : unSelectedColor,
                size: 26,
              ),
              const SizedBox(height: 4),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1 : 0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 11,
                      color: maincolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
