import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/entites/accounts_entity.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class AddAccountUsecase {
  final HomeRepository homeRepository;

  AddAccountUsecase(this.homeRepository);

  Future<Either<Failure, AccountEntity>> call(String accountType) {
    return homeRepository.addAccount(accountType);
  }
}