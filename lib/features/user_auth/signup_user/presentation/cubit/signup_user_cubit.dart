import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/entities/signup_user_response_entity.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/usecases/signup_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_user_state.dart';

class SignupUserCubit extends Cubit<SignupUserState> {
  final SignupUserUsecase signupUserUsecase;
  SignupUserCubit(this.signupUserUsecase) : super(SignupUserInitial());

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController nationalId = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController city= TextEditingController();
  final TextEditingController zipCode = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController maritalStatus = TextEditingController();

  Future<void> signupUser(SignupUserModel signupUserModel) async {
    emit(SignupUserLoading());
    final response = await signupUserUsecase.signupUser(signupUserModel);
    response.fold(
      (l) => emit(SignupUserError(l.errMessage)),
      (r) => emit(SignupUserSuccess(r)),
    );
  }
}
