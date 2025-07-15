class DepositEntity {
  final int depositId;
  final double amount;
  final String status;
  final DateTime date;
  final int userId;
  final String message;

  DepositEntity({
    required this.depositId,
    required this.amount,
    required this.status,
    required this.date,
    required this.userId,
    required this.message,
  });
}
