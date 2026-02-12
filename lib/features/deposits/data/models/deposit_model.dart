import 'package:bank_system/features/deposits/domian/entiites/deposit_entity.dart';

class DepositModel extends DepositEntity{
  DepositModel({
    required super.depositId,
     required super.amount,
      required super.status,
       required super.date, 
       required super.userId,
        required super.message});

        
  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      depositId: json['iidd'] as int,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      date: DateTime.parse(json['date']),
      userId: json['userId'] as int,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iidd': depositId,
      'amount': amount,
      'status': status,
      'date': date.toIso8601String(),
      'userId': userId,
      'message': message,
    };
  }
  
}