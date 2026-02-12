import 'package:bank_system/core/extention/validators.dart';
import 'package:bank_system/core/widgets/custom_textfield.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/date_picker.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/gender_dropdown.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/material_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupUserCubit>().formKey,
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
            children: [
              Expanded(
                child: CustomTextformfield(
                  hintText: 'First Name',
                  keyboardType: TextInputType.name,
                  controller: context.read<SignupUserCubit>().firstname,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomTextformfield(
                  hintText: 'Last Name',
                  keyboardType: TextInputType.name,
                  controller: context.read<SignupUserCubit>().lastname,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextformfield(
            validator: (p0) {
              return
              Validators.email(p0);
            },
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(Icons.email_outlined, color: Colors.black),
            controller: context.read<SignupUserCubit>().email,
          ),
          const SizedBox(height: 20),
          CustomTextformfield(
            validator: (p0) {
              Validators.password(p0);
            return null;
            },
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: Icon(Icons.lock, color: Colors.black),
            obscureText: true,
            controller: context.read<SignupUserCubit>().password,
          ),
          const SizedBox(height: 20),
          CustomTextformfield(
            validator: (p0) {
              Validators.phone(p0);
              return null;
            },
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
            suffixIcon: Icon(Icons.phone, color: Colors.black),
            controller: context.read<SignupUserCubit>().phoneNumber,
          ),
                  const SizedBox(height: 20),
      
          CustomTextformfield(
            
            controller: context.read<SignupUserCubit>().pinCode,
            keyboardType: TextInputType.number,
                   suffixIcon: Icon(Icons.lock, color: Colors.black),
      
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter PIN code';
              }
              if (value.length < 4) {
                return 'PIN must be at least 4 digits';
              }
              return null;
            }, hintText: 'pin Code',
          ),
      
          const SizedBox(height: 20),
          CustomTextformfield(
            validator: (p0) {
              Validators.nationalId(p0);
              return null;
            },
             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hintText: 'National Id',
            keyboardType: TextInputType.number,
            controller: context.read<SignupUserCubit>().nationalId,
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            child: DatePickerField(
              onDateSelected: (date) {
                context.read<SignupUserCubit>().dateOfBirth.text = date;
              },
              label: 'Date of Birth',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextformfield(
                  hintText: 'City',
                  keyboardType: TextInputType.name,
                  controller: context.read<SignupUserCubit>().city,
                  suffixIcon: Icon(Icons.location_city, color: Colors.black),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomTextformfield(
                  suffixIcon: Icon(Icons.location_city, color: Colors.black),
                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (p0) {
                      Validators.zipCode(p0);
                      return null;
                    },
                  hintText: 'Zip Code',
                  controller: context.read<SignupUserCubit>().zipCode,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
      
                  child: GenderDropdown(
                    onChanged: (value) {
                      context.read<SignupUserCubit>().gender.text = value;
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: MaritalStatusDropdown(
                    onChanged: (value) {
                      context.read<SignupUserCubit>().maritalStatus.text = value;
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
