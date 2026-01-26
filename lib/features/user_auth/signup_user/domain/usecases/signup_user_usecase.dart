import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/entities/signup_user_response_entity.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/repositories/signup_user_repositry.dart';
import 'package:dartz/dartz.dart';

class SignupUserUsecase {
  final SignupUserRepository signupUserRepository;
  SignupUserUsecase({required this.signupUserRepository});

  Future<Either<Failure, SignupUserResponseEntity>> signupUser(SignupRequestModel signupUserModel) => signupUserRepository.signupUser(signupUserModel );
}