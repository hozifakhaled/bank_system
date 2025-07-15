import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/entites/deposit_entity.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class DepositUsecase {
  final HomeRepository homeRepository;

  DepositUsecase(this.homeRepository);

  Future<Either<Failure, DepositEntity>> call(double amount) {
    return homeRepository.createDeposit(amount);
  }
  
}
