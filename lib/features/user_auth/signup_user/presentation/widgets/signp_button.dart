import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/widgets/custom_button.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/address_model.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupUserCubit, SignupUserState>(
      builder: (context, state) {
        if (state is SignupUserSuccess) {
          Fluttertoast.showToast(
            msg: "Signup Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black.withOpacity(0.7),
            textColor: Colors.white,
            fontSize: 36,
          );

          WidgetsBinding.instance.addPostFrameCallback((_) {
            CacheHelper.sharedPreferences.setString(
              'token',
              state.signupUserResponseEntity.token,
            );
            GoRouter.of(context).go(Routes.choiceaccounttype);
          });
        }

        return CustomButton(
          text: state is SignupUserLoading ? null : 'Sign Up',
          isLoading: state is SignupUserLoading,

          onTap: state is SignupUserLoading
              ? null
              : () {
                  context.read<SignupUserCubit>().signupUser(
                    SignupRequestModel(
                      user: UserModel(
                        firstName: context
                            .read<SignupUserCubit>()
                            .firstname
                            .text
                            .trim(),
                        lastName: context
                            .read<SignupUserCubit>()
                            .lastname
                            .text
                            .trim(),
                        email: context
                            .read<SignupUserCubit>()
                            .email
                            .text
                            .trim(),
                        role: 'USER',
                        password: context
                            .read<SignupUserCubit>()
                            .password
                            .text
                            .trim(),
                        phoneNumber: context
                            .read<SignupUserCubit>()
                            .phoneNumber
                            .text
                            .trim(),
                        nationalId: context
                            .read<SignupUserCubit>()
                            .nationalId
                            .text
                            .trim(),
                        dateOfBirth: DateTime.parse(
                          context
                              .read<SignupUserCubit>()
                              .dateOfBirth
                              .text
                              .trim(),
                        ),
                        address: AddressModel(
                          city: context
                              .read<SignupUserCubit>()
                              .city
                              .text
                              .trim(),
                          zipCode: context
                              .read<SignupUserCubit>()
                              .zipCode
                              .text
                              .trim(),
                        ),
                        gender: context
                            .read<SignupUserCubit>()
                            .gender
                            .text
                            .trim(),
                        maritalStatus: context
                            .read<SignupUserCubit>()
                            .maritalStatus
                            .text
                            .trim(),
                        pinCode: context
                            .read<SignupUserCubit>()
                            .pinCode
                            .text
                            .trim(),
                      ),
                    ),
                  );
                },
        );
      },
    );
  }
}
