import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignupUserRepository {
  Future<Either<Failure, SignupUserResponseModel>> signupUser(SignupUserModel signupUserModel);
}