import 'package:bank_system/features/profile/persentation/widgets/editable_textfield_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_action_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_header_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_info_card.dart';
import 'package:bank_system/features/profile/persentation/widgets/recent_activity_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/save_button_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController nameController = TextEditingController(text: 'Abdelhamed Salah');
  final TextEditingController addressController = TextEditingController(text: '123 Street, Cairo, Egypt');
  final TextEditingController phoneController = TextEditingController(text: '+201234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderWidget(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Editable Fields
                  EditableFieldWidget(
                    label: 'Full Name',
                    initialValue: nameController.text,
                    controller: nameController,
                  ),
                  EditableFieldWidget(
                    label: 'Address',
                    initialValue: addressController.text,
                    controller: addressController,
                  ),
                  EditableFieldWidget(
                    label: 'Phone Number',
                    initialValue: phoneController.text,
                    controller: phoneController,
                  ),

                  const SizedBox(height: 16),

                  // Info Cards
                  const ProfileInfoCardWidget(
                    title: 'Account Number',
                    value: '12345678',
                    icon: Icons.account_box,
                  ),
                  const ProfileInfoCardWidget(
                    title: 'Account Type',
                    value: 'Current Account',
                    icon: Icons.account_balance,
                  ),
                  const ProfileInfoCardWidget(
                    title: 'Balance',
                    value: '\$5000',
                    icon: Icons.account_balance_wallet,
                  ),

                  const SizedBox(height: 16),

                  // Actions / Notifications
                 
                  ProfileActionWidget(
                    icon: Icons.notifications,
                    label: 'Notifications',
                    onTap: () {},
                  ),
                  ProfileActionWidget(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  // Save Button
                  SaveButtonWidget(
                    onPressed: () {
                     
                    },
                  ),

                  const SizedBox(height: 24),

                  // Recent Activity
                  const RecentActivityWidget(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
