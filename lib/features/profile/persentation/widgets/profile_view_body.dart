
import 'package:bank_system/features/profile/persentation/widgets/profile_action_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_header_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_section.dart';
import 'package:bank_system/features/profile/persentation/widgets/save_button_widget.dart';
import 'package:flutter/material.dart';

class BodyProfileView extends StatelessWidget {
  const BodyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileHeaderWidget(),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              ProfileSection(),
              const SizedBox(height: 16),
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

              SaveButtonWidget(onPressed: () {}),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
