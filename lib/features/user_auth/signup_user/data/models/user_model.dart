import 'package:bank_system/features/user_auth/signup_user/data/models/address_model.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String password;
  final String phoneNumber;
  final String nationalId;
  final DateTime dateOfBirth;
  final String pinCode;
  final AddressModel address;
  final String gender;
  final String maritalStatus;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.password,
    required this.phoneNumber,
    required this.nationalId,
    required this.dateOfBirth,
    required this.pinCode,
    required this.address,
    required this.gender,
    required this.maritalStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      nationalId: json['nationalId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      pinCode: json['pinCode'],
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
      'pinCode': pinCode,
      'address': address.toJson(),
      'gender': gender,
      'maritalStatus': maritalStatus,
    };
  }
}
