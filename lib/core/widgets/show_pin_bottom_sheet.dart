import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/features/islamicaccount/presentation/pages/islamic_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void showPinBottomSheet(BuildContext context , Function() onPinEntered) {
  TextEditingController pinController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Enter PIN Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              /// 🔢 PIN CODE FIELD
              PinCodeTextField(
                appContext: context,
                controller: pinController,
                length: 6,
                keyboardType: TextInputType.number,
                obscureText: true,
                animationType: AnimationType.fade,
                cursorColor: mainColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 55,
                  fieldWidth: 45,
                  activeFillColor: mainColor.withOpacity(0.1),
                  selectedFillColor: mainColor.withOpacity(0.2),
                  inactiveFillColor: Colors.grey.shade100,
                  activeColor: mainColor,
                  selectedColor: mainColor,
                  inactiveColor: Colors.grey.shade300,
                ),
                onChanged: (value) {},
              ),

              const SizedBox(height: 28),

              /// 🔘 CONFIRM BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (pinController.text.length == 6&& int.tryParse(pinController.text) ==
                        CacheHelper.sharedPreferences.getInt('pincode')) {
                     
                    onPinEntered();
                      Navigator.of(context).pop();
                    } else {
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid PIN. Please try again."),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      );
    },
  );
}
