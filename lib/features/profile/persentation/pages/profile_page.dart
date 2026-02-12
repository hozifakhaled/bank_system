import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/features/profile/persentation/cubit/get_profile_cubit.dart';
import 'package:bank_system/features/profile/persentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
 const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  sl<GetProfileCubit>()..getProfile(CacheHelper.sharedPreferences.getString('email') ?? ''),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: SingleChildScrollView(
          child: BodyProfileView(
          
          ),
        ),
      ),
    );
  }
}
