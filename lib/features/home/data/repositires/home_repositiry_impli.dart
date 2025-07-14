import 'dart:async';

import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_local.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_remote.dart';
import 'package:bank_system/features/home/data/model/account_model.dart';
import 'package:bank_system/features/home/data/model/category_model.dart';
import 'package:bank_system/features/home/domain/entites/accounts_entity.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class HomeRepositiryImpli implements HomeRepository {
  final NetworkInfo networkInfo;
  final CategoriesDataSourceRemote remote;
  final DioConsumer dioConsumer;
  final CategoriesDataSourceLocal local;

  HomeRepositiryImpli(this.dioConsumer, {
    required this.networkInfo,
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final localCate = await local.getLastCategories();
      unawaited(_updateCategories()); // لا تؤثر على النتيجة مباشرةً
      return right(localCate);
    } catch (_) {
      // إذا فشل الـ local نحاول عبر الـ remote
      if (await networkInfo.isConnected) {
        try {
          final remoteModel = await remote.getAllCategories();
          await local.cacheCategories(remoteModel);
          return right(remoteModel);
        } on ServerException catch (e) {
          return left(Failure(errMessage: e.errorModel.errorMessage));
        } catch (e) {
          return left(Failure(errMessage: 'Unexpected error: $e'));
        }
      } else {
        return left(Failure(errMessage: 'No internet connection'));
      }
    }
  }

  Future<void> _updateCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteModel = await remote.getAllCategories();
        await local.cacheCategories(remoteModel);
      } catch (_) {
        // تجاهل الخطأ بصمت أو سجل لو حبيت
      }
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> addAccount(String accountType) async {
    final response = await dioConsumer.post(
      path: Endpoints.accounts,
      data: {"accountType": accountType},
    );
    return response.fold(
      (error) {
        throw ServerException(
          ErrorModel(status: 500, errorMessage: "خطأ في الاتصال: $error"),
        );
      },
      (response) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return right(AccountModel.fromJson(data));
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
}
