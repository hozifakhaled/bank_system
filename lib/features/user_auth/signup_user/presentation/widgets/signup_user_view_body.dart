import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/widgets/custom_button.dart';
import 'package:bank_system/core/widgets/custom_textfield.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/date_picker.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/gender_dropdown.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/material_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                  children:  [
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
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icon(Icons.email_outlined, color: Colors.black),
                   controller: context.read<SignupUserCubit>().email,
                ),
                const SizedBox(height: 20),
                 CustomTextformfield(
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: Icon(Icons.lock, color: Colors.black),
                  obscureText: true,
                  controller: context.read<SignupUserCubit>().password,
                ),
                const SizedBox(height: 20),
                 CustomTextformfield(
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  suffixIcon: Icon(Icons.phone, color: Colors.black),
                  controller: context.read<SignupUserCubit>().phoneNumber,
                ),
                const SizedBox(height: 20),
                 CustomTextformfield(
                  hintText: 'National Id',
                  keyboardType: TextInputType.number,
                  controller: context.read<SignupUserCubit>().nationalId,
                ),
                const SizedBox(height: 20),
                DatePickerField( onDateSelected: (date) {
    context.read<SignupUserCubit>().dateOfBirth.text = date;
  }, label: 'Date of Birth',),
                const SizedBox(height: 20),
                Row(
                  children:  [
                    Expanded(
                      child: CustomTextformfield(
                        hintText: 'City',
                        keyboardType: TextInputType.name,
                         controller: context.read<SignupUserCubit>().city,
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
                        controller: context.read<SignupUserCubit>().zipCode,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                     Expanded(child: GenderDropdown(
                       onChanged: (value) {
    context.read<SignupUserCubit>().gender.text = value;
  },
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                      child:MaritalStatusDropdown(
  onChanged: (value) {
    context.read<SignupUserCubit>().maritalStatus.text = value;
  },
),

                    ),
                  ],
                ),
                const SizedBox(height: 30),
               BlocBuilder<SignupUserCubit, SignupUserState>(
  builder: (context, state) {
   if (state is SignupUserSuccess) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    GoRouter.of(context).push(Routes.splah);
  });
}

    return CustomButton(
      text: state is SignupUserLoading ? null : 'Sign Up',
      isLoading: state is SignupUserLoading,
      
      onTap: state is SignupUserLoading ? null : () {
        context.read<SignupUserCubit>().signupUser(
          SignupUserModel(
            firstName: context.read<SignupUserCubit>().firstname.text.trim(),
            lastName: context.read<SignupUserCubit>().lastname.text.trim(),
            email: context.read<SignupUserCubit>().email.text.trim(),
            role: 'USER',
            password: context.read<SignupUserCubit>().password.text.trim(),
            phoneNumber: context.read<SignupUserCubit>().phoneNumber.text.trim(),
            nationalId: context.read<SignupUserCubit>().nationalId.text.trim(),
            dateOfBirth: DateTime.parse(context.read<SignupUserCubit>().dateOfBirth.text.trim()),
            address: AddressModel(
              city: context.read<SignupUserCubit>().city.text.trim(),
              zipCode: context.read<SignupUserCubit>().zipCode.text.trim(),
            ),
            gender: context.read<SignupUserCubit>().gender.text.trim(),
            maritalStatus: context.read<SignupUserCubit>().maritalStatus.text.trim(),
          ),
        );
      },
    );
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
