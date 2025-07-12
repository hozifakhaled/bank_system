import 'package:bank_system/features/user_auth/signup_user/domain/entities/signup_user_response_entity.dart';

class SignupUserResponseModel  extends SignupUserResponseEntity{
  SignupUserResponseModel({required super.token, required super.role});
  factory SignupUserResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupUserResponseModel(
      token: json['token'],
      role: json['role'],
    );

  }
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'role': role,
    };
  }
}