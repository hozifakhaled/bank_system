import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/entites/accounts_entity.dart';
import 'package:bank_system/features/home/domain/entites/category_entiey.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, AccountEntity>> addAccount(String accountType);

}