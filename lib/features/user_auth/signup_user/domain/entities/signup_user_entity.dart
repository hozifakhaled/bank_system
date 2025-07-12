  class SignupUserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String password;
  final String phoneNumber;
  final String nationalId;
  final DateTime dateOfBirth;
  final AddressEntity address;
  final String gender;
  final String maritalStatus;

  SignupUserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.password,
    required this.phoneNumber,
    required this.nationalId,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
    required this.maritalStatus,
  });
}

class AddressEntity {
  final String city;
  final String zipCode;

  AddressEntity({
    required this.city,
    required this.zipCode,
  });
}

