part of 'signup_user_cubit.dart';

abstract class SignupUserState extends Equatable {
  const SignupUserState();

  @override
  List<Object> get props => [];
}

class SignupUserInitial extends SignupUserState {}

class SignupUserLoading extends SignupUserState {}

class SignupUserError extends SignupUserState {
  final String message;
  const SignupUserError(this.message);
}

class SignupUserSuccess extends SignupUserState {
  final SignupUserResponseEntity signupUserResponseEntity;
  const SignupUserSuccess(this.signupUserResponseEntity);

}