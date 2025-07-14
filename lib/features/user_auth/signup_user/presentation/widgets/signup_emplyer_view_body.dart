/*import 'package:bank_system/core/widgets/custom_button.dart';
import 'package:bank_system/core/widgets/custom_textfield.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/date_picker.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/gender_dropdown.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/material_status.dart';
import 'package:flutter/material.dart';

class SignupEmployeeViewBody extends StatelessWidget {
  const SignupEmployeeViewBody({super.key});

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.badge, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'AS EMPLOYEE',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // First and Last Name
                Row(
                  children: [
                    Expanded(
                      child: CustomTextformfield(hintText: 'First Name', keyboardType: TextInputType.name,),
                    ),
                    const SizedBox(width: 20),
                    Expanded(child: CustomTextformfield(hintText: 'Last Name', keyboardType: TextInputType.name,)),
                  ],
                ),
                const SizedBox(height: 20),

                // Email
                CustomTextformfield(
                  hintText: 'Email',

                  suffixIcon: const Icon(Icons.email_outlined, color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // Password
                CustomTextformfield(
                  hintText: 'Password',

                  obscureText: true,
                  suffixIcon: const Icon(Icons.lock, color: Colors.black),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),

                // Phone
                CustomTextformfield(
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  suffixIcon: const Icon(Icons.phone, color: Colors.black),
                ),
                const SizedBox(height: 20),

                // National ID
                CustomTextformfield(
                  hintText: 'National ID',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // Date of Birth
                DatePickerField(
                  label: 'Date of Birth',
                
                ),
                const SizedBox(height: 20),

                // Employee ID
                CustomTextformfield(
                  hintText: 'Employee ID',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // Job Title
                CustomTextformfield(
                  hintText: 'Job Title',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),

                // Department
                CustomTextformfield(
                  hintText: 'Department',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),

                // Date of Hiring
                DatePickerField( label: 'Date of Hiring',),
                const SizedBox(height: 20),

                // Work Branch
                CustomTextformfield(
                  hintText: 'Work Branch',
                  keyboardType: TextInputType.streetAddress,
                ),
                const SizedBox(height: 20),

                // City and Zip
                Row(
                  children: [
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'City',
                        keyboardType: TextInputType.streetAddress,
                        suffixIcon: const Icon(Icons.location_city, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'Zip Code',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Gender and Marital Status
                Row(
                  children: [
                    Expanded(child: GenderDropdown()),
                    const SizedBox(width: 20),
                    Expanded(child: MaritalStatusDropdown()),
                  ],
                ),
                const SizedBox(height: 30),

                // Submit
                CustomButton(text: 'Submit', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/