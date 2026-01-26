import 'package:bank_system/features/user_auth/login_user/data/models/login_request_model.dart';
import 'package:bank_system/features/user_auth/login_user/data/repositories/login_repo.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.loginRepo) : super(LoginUserInitial());
 final LoginRepo loginRepo;
    final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pinController = TextEditingController();

    Future<void> loginUser(LoginRequest loginUserModel) async {
    emit(LoginUserLoading());
    final response = await loginRepo.loginUser(loginUserModel);
    response.fold(
      (l) => emit(LoginUserError(l.errMessage)),
      (r) => emit(LoginUserSuccess(r)),
    );
  }
}
