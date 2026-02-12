import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/profile/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<UserEntity,Failure>> getProfile(String email);
}