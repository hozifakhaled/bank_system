import 'package:bank_system/features/tranferation/persentation/widgets/amount_field.dart';
import 'package:bank_system/features/tranferation/persentation/widgets/note_field.dart';
import 'package:bank_system/features/tranferation/persentation/widgets/recent_tranfer.dart';
import 'package:bank_system/features/tranferation/persentation/widgets/tranfer_account_field.dart';
import 'package:bank_system/features/tranferation/persentation/widgets/tranfer_confirm_button.dart';
import 'package:bank_system/features/tranferation/persentation/widgets/transfer_header_widget.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          const HeaderWidget(),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AccountFieldWidget(
                    label: 'From Account',
                    isDropdown: true,
                    options: ['Current Account', 'Islamic Account'],
                  ),
                  AccountFieldWidget(label: 'To Account'),
                  AmountFieldWidget(),
                  NoteFieldWidget(),
                  ConfirmButtonWidget(),
                  SizedBox(height: 32),
                  RecentTransfersWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
