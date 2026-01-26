import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/user_auth/login_user/data/models/login_request_model.dart';
import 'package:bank_system/features/user_auth/signup_user/data/models/signup_user_response_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final DioConsumer dioConsumer;

  LoginRepo({required this.dioConsumer});

  Future<Either<Failure, SignupUserResponseModel>> loginUser(
    LoginRequest loginRequest,
  ) async {
    final response = await dioConsumer.post(
      path: Endpoints.loginUser,
      data: loginRequest.toJson(),
    );
    return response.fold(
      (error) {
        throw ServerException(
          ErrorModel(status: 403, errorMessage: " network error : $error"),
        );
      },
      (response) {
        if (response.statusCode == 200) {
          final data = response.data;
          return right(SignupUserResponseModel.fromJson(data));
        } else {
          final data = response.data;
          final error = ErrorModel.fromJson(data);
          return left(Failure(errMessage: " ${error.errorMessage}"));
        }
      },
    );
  }
}
