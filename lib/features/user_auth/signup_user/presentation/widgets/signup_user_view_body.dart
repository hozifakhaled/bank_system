import 'package:bank_system/core/widgets/custom_button.dart';
import 'package:bank_system/core/widgets/custom_textfield.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/date_picker.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/gender_dropdown.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/material_status.dart';
import 'package:flutter/material.dart';

class SignupUserViewBody extends StatelessWidget {
  const SignupUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person, color: Colors.black),
                    SizedBox(width: 10),
                    Center(
                      child: Text(
                        'AS USER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'First Name',
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'Last Name',
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomTextformfield(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icon(Icons.email_outlined, color: Colors.black),
                ),
                const SizedBox(height: 20),
                const CustomTextformfield(
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: Icon(Icons.lock, color: Colors.black),
                ),
                const SizedBox(height: 20),
                const CustomTextformfield(
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  suffixIcon: Icon(Icons.phone, color: Colors.black),
                ),
                const SizedBox(height: 20),
                const CustomTextformfield(
                  hintText: 'National Id',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                DatePickerField(onDateSelected: (date) {}),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'City',
                        keyboardType: TextInputType.name,
                        suffixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'Zip Code',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(child: GenderDropdown()),
                    const SizedBox(width: 20),
                    Expanded(
                      child:MaritalStatusDropdown(
  onChanged: (value) {
  },
),

                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Sign Up',
                  onTap: () {
                    // TODO: handle sign-up logic
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
