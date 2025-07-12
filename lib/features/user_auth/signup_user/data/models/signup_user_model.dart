import 'package:bank_system/features/user_auth/signup_user/domain/entities/signup_user_entity.dart';


class SignupUserModel extends SignupUserEntity {
  SignupUserModel({
    required String firstName,
    required String lastName,
    required String email,
    required String role,
    required String password,
    required String phoneNumber,
    required String nationalId,
    required DateTime dateOfBirth,
    required AddressModel address,
    required String gender,
    required String maritalStatus,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          role: role,
          password: password,
          phoneNumber: phoneNumber,
          nationalId: nationalId,
          dateOfBirth: dateOfBirth,
          address: address,
          gender: gender,
          maritalStatus: maritalStatus,
        );

  factory SignupUserModel.fromJson(Map<String, dynamic> json) {
    return SignupUserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      nationalId: json['nationalId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      address: AddressModel.fromJson(json['address']),
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'password': password,
      'phoneNumber': phoneNumber,
      'nationalId': nationalId,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'address': (address as AddressModel).toJson(),
      'gender': gender,
      'maritalStatus': maritalStatus,
    };
  }
}

class AddressModel extends AddressEntity {
  AddressModel({
    required String city,
    required String zipCode,
  }) : super(
          city: city,
          zipCode: zipCode,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      city: json['city'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'zipCode': zipCode,
    };
  }
}
