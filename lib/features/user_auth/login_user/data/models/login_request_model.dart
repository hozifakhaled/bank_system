class LoginRequest {
 final UserModel user;

  LoginRequest({required this.user, });

  Map<String, dynamic> toJson() {
    return {'user': user.toJson()};
  }
}

class UserModel {
  final String email;

  final String pinCode;

  UserModel({required this.email, required this.pinCode});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], pinCode: json['pinCode']);
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'pinCode': pinCode,
    };
  }
}
