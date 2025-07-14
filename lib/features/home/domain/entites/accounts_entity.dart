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
