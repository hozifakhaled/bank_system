import 'package:bank_system/features/islamicaccount/presentation/pages/islamic_account_page.dart';
import 'package:bank_system/features/profile/persentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

const maincolor = Color(0xFF6366F1);
const unSelectedColor = Color(0xFF9CA3AF);

class CustomIslamicNavbar extends StatefulWidget {
  const CustomIslamicNavbar({super.key});

  @override
  State<CustomIslamicNavbar> createState() => _CustomIslamicNavbarState();
}

class _CustomIslamicNavbarState extends State<CustomIslamicNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    IslamicAccountHomePage(),                      
      ProfilePage(),                     
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
