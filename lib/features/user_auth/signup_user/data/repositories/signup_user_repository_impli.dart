import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_model.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_response_model.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/repositories/signup_user_repositry.dart';
import 'package:dartz/dartz.dart';

class SignupUserRepositoryImpli implements SignupUserRepository {
  final DioConsumer dioConsumer;

  SignupUserRepositoryImpli({required this.dioConsumer});
  @override
  Future<Either<Failure, SignupUserResponseModel>> signupUser(SignupUserModel signupUserModel) async {
    try {
  final response = await dioConsumer.post(path: Endpoints.signupUser, data: signupUserModel.toJson());
  return response.fold(
    (l) => Left(Failure(errMessage: l.toString())),
    (r) => Right(SignupUserResponseModel.fromJson(r.data)),
  );
} on Exception catch (e) {
  return Left(Failure(errMessage: e.toString()));}
  }
}