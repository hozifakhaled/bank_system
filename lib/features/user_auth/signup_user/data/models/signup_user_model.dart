import 'package:bank_system/features/user_auth/signup_user/data/models/user_model.dart';

class SignupRequestModel {
  final UserModel user;

  SignupRequestModel({required this.user});

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) {
    return SignupRequestModel(
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
    };
  }
}
