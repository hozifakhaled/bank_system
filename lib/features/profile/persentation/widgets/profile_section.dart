import 'package:bank_system/features/profile/persentation/cubit/get_profile_cubit.dart';
import 'package:bank_system/features/profile/persentation/widgets/editable_textfield_widget.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return Column(
            children: [
              EditableFieldWidget(
                label: 'Full Name',
                initialValue:
                    '${state.profile.firstName} ${state.profile.lastName}',
                controller: context.read<GetProfileCubit>().nameController,
              ),
              EditableFieldWidget(
                label: 'Address',
                initialValue: state.profile.address.city,
                controller: context.read<GetProfileCubit>().addressController,
              ),
              EditableFieldWidget(
                label: 'Phone Number',
                initialValue: state.profile.phoneNumber,
                controller: context.read<GetProfileCubit>().phoneController,
              ),

              const SizedBox(height: 16),

              // Info Cards
              ProfileInfoCardWidget(
                title: 'Account Number',
                value: context.read<GetProfileCubit>().maskAccountNumber(
                  state.profile.account.accountNumber,
                ),
                icon: Icons.account_box,
              ),
              ProfileInfoCardWidget(
                title: 'Email',
                value: state.profile.email,
                icon: Icons.email,
              ),
              ProfileInfoCardWidget(
                title: 'gender',
                value: state.profile.gender,
                icon: Icons.person,
              ),
              ProfileInfoCardWidget(
                title: 'Account Type',
                value: state.profile.account.accountType,
                icon: Icons.account_balance,
              ),
            ],
          );
        } else if (state is GetProfileLoading) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: const CircularProgressIndicator(),
            ),
          );
        } else if (state is GetProfileFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Container();
        }
      },
    );
  }
}
// ahmed magdy