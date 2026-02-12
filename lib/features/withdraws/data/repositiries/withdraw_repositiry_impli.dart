import 'dart:convert';
import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/deposits/data/models/deposit_model.dart';
import 'package:bank_system/features/withdraws/domian/repositires/withdraw_repo.dart';
import 'package:dartz/dartz.dart';

class WithdrawRepositiryImpli implements WithdrawRepo {
    final NetworkInfo networkInfo;
  final DioConsumer dioConsumer;

  WithdrawRepositiryImpli({required this.networkInfo, required this.dioConsumer});
  @override
  Future<Either<Failure, DepositModel>> withdraw(double amount) async {
    try {
      final response = await dioConsumer.post(
        path: Endpoints.withdraw,
        data: {"amount": amount},
      );
      return response.fold(
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

            final withdraw = DepositModel.fromJson(decoded);
            return right(withdraw);
          } catch (e) {
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
      return left(Failure(errMessage: e.toString()));
    }
  }

 
}