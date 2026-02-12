import 'package:bank_system/features/profile/domain/entities/user_entity.dart';
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.role,
    required super.phoneNumber,
    required super.nationalId,
    required super.dateOfBirth,
    required super.gender,
    required super.maritalStatus,
    super.employer,
    required super.address,
    required super.account,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      phoneNumber: json['phoneNumber'],
      nationalId: json['nationalId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      employer: json['employer'],
      address: AddressModel.fromJson(json['address']),
      account: AccountModel.fromJson(json['account']),
    );
  }
    toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'phoneNumber': phoneNumber,
      'nationalId': nationalId,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'maritalStatus': maritalStatus,
      'employer': employer,
    'address': (address as AddressModel).toJson(),
      'account': (account as AccountModel).toJson(),
    };
  }
}


class AccountModel extends AccountEntity {
  const AccountModel({
    required super.id,
    required super.accountType,
    required super.accountNumber,
    required super.balance,
    required super.createdAt,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      accountType: json['accountType'],
      accountNumber: json['accountNumber'],
      balance: (json['balance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
   toJson() {
    return {
    {'id': id,
      'accountType': accountType,
      'accountNumber': accountNumber,
      'balance': balance,
      'createdAt': createdAt.toIso8601String(),
     } };
  }
}




class AddressModel extends AddressEntity {
  const AddressModel({
    required super.city,
    required super.zipCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      city: json['city'],
      zipCode: json['zipCode'],
    );
  }
    toJson() {
      return {
        'city': city,
        'zipCode': zipCode,
      };
    }
}
