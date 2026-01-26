import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/entities/signup_user_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignupUserRepository {
  Future<Either<Failure, SignupUserResponseEntity>> signupUser(SignupRequestModel signupUserModel);
}