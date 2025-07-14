
import 'package:bank_system/features/home/domain/entites/accounts_entity.dart';

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
      id: json['id'] as int,
      accountType: json['accountType'] as String,
      accountNumber: json['accountNumber'] as String,
      balance: (json['balance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountType': accountType,
      'accountNumber': accountNumber,
      'balance': balance,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
