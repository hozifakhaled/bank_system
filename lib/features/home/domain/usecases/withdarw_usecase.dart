import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/data/repositires/home_repositiry_impli.dart';
import 'package:bank_system/features/home/domain/entites/deposit_entity.dart';
import 'package:dartz/dartz.dart';

class WithdarwUsecase {
  final HomeRepositiryImpli homeRepositiryImpli;
  WithdarwUsecase(this.homeRepositiryImpli);
  Future<Either<Failure, DepositEntity>> call(double amount) => homeRepositiryImpli.withdraw(amount);
}