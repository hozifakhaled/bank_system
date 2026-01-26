part of 'login_user_cubit.dart';

abstract class LoginUserState extends Equatable {
  const LoginUserState();

  @override
  List<Object> get props => [];
}

class LoginUserInitial extends LoginUserState {}


class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {
  final SignupUserResponseModel loginResponseModel;
  const LoginUserSuccess(this.loginResponseModel);
  @override
  List<Object> get props => [loginResponseModel];
}

class LoginUserError extends LoginUserState {
  final String errMessage;
  const LoginUserError(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
