import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/entites/accounts_entity.dart';
import 'package:bank_system/features/home/domain/entites/category_entiey.dart';
import 'package:bank_system/features/home/domain/entites/deposit_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, AccountEntity>> addAccount(String accountType);
  Future<Either<Failure, DepositEntity>> createDeposit(double amount);
  Future<Either<Failure, DepositEntity>> withdraw(double amount);

}