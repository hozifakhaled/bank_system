import 'dart:convert';
import 'dart:developer';

import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/deposits/data/models/deposit_model.dart';
import 'package:bank_system/features/deposits/domian/repositreies/deposits_repo.dart';
import 'package:dartz/dartz.dart';
// ignore: implementation_imports
import 'package:dio/src/form_data.dart';

class DepositRepoImpli implements DepositsRepository {

    final DioConsumer dioConsumer;
  DepositRepoImpli(this.dioConsumer);
   @override
  
  Future<Either<Failure, DepositModel>> createDeposit(double amount) async {
    try {
      final result = await dioConsumer.post(
        path: Endpoints.deposit,
        data: {"amount": amount},
      );

      return result.fold(
        (error) {
          throw ServerException(
            ErrorModel(status: 500, errorMessage: "Failed: $error"),
          );
        },
        (response) {
          try {
            final raw = response.data;

            // تحقق من إذا كانت البيانات فاضية
            if (raw == null || raw.toString().trim().isEmpty) {
              throw ServerException(
                ErrorModel(
                  status: 500,
                  errorMessage: "Empty response from server",
                ),
              );
            }

            // فك البيانات حسب النوع
            final Map<String, dynamic> decoded = raw is String
                ? json.decode(raw)
                : raw as Map<String, dynamic>;

            final deposit = DepositModel.fromJson(decoded);
            return right(deposit);
          } catch (e) {
            log("Error parsing response: $e");
            log("Raw response: ${response.data}");
            throw ServerException(
              ErrorModel(
                status: 500,
                errorMessage: "Failed to parse response: $e",
              ),
            );
          }
        },
      );
    } catch (e) {
      log("General error in createDeposit: $e");
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
   Future<Either<Failure, String>> sendPdf(FormData formData) async {
    try {
  final response = await dioConsumer.post(
    isFormData: true,
    path: Endpoints.sendPdf,
    data: formData,
  );
  return response.fold(
    (error) {
      throw ServerException(
        ErrorModel(status: 500, errorMessage: "Failed: $error"),
      );
    },
    (response) {
      final data = response.data;
      return right(data);
    },
  );
}  catch (e) {
  return left(Failure(errMessage: e.toString()));
}
  }

}
