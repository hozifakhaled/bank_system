import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/deposits/domian/entiites/deposit_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DepositsRepository {
  Future<Either<Failure, DepositEntity>> createDeposit(double amount);
 
  Future<Either<Failure, String>> sendPdf(FormData formData);
}