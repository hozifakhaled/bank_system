class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String phoneNumber;
  final String nationalId;
  final DateTime dateOfBirth;
  final String gender;
  final String maritalStatus;
  final String? employer;
  final AddressEntity address;
  final AccountEntity account;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.phoneNumber,
    required this.nationalId,
    required this.dateOfBirth,
    required this.gender,
    required this.maritalStatus,
    this.employer,
    required this.address,
    required this.account,
  });
}
class AddressEntity {
  final String city;
  final String zipCode;

  const AddressEntity({
    required this.city,
    required this.zipCode,
  });
}
class AccountEntity {
  final int id;
  final String accountType;
  final String accountNumber;
  final double balance;
  final DateTime createdAt;

  const AccountEntity({
    required this.id,
    required this.accountType,
    required this.accountNumber,
    required this.balance,
    required this.createdAt,
  });
}
