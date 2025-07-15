import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class  BalanceUsecase {
  final HomeRepository homeRepositiry;
  BalanceUsecase({required this.homeRepositiry});

  Future<Either<Failure, double>> call() => homeRepositiry.balance();
}