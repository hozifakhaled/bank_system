import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/deposits/domian/entiites/deposit_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WithdrawRepo {
  Future<Either<Failure, DepositEntity>> withdraw(double amount);
}