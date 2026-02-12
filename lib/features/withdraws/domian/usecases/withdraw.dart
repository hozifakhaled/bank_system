import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/deposits/domian/entiites/deposit_entity.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class WithdarwUsecase {
  final HomeRepository homeRepositiry;
  WithdarwUsecase(this.homeRepositiry);
  Future<Either<Failure, DepositEntity>> call(double amount) => homeRepositiry.withdraw(amount);
}