import 'dart:async';
import 'dart:convert';

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
import 'package:bank_system/features/home/data/model/deposit_model.dart';
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
    if (await networkInfo.isConnected) {
      try {
        // أولاً نحاول جلب البيانات من الـ remote
        final remoteModel = await remote.getAllCategories();
        
        // نحفظ البيانات في الـ cache
        await local.cacheCategories(remoteModel);
        
        return right(remoteModel);
      } on ServerException {
        // إذا فشل الـ remote، نحاول الـ local
        return _getFromLocal();
      } catch (e) {
        // إذا فشل الـ remote، نحاول الـ local
        return _getFromLocal();
      }
    } else {
      // لا يوجد اتصال بالإنترنت، نحاول الـ local
      return _getFromLocal();
    }
  }

  Future<Either<Failure, List<CategoryModel>>> _getFromLocal() async {
    try {
      final localCate = await local.getLastCategories();
      unawaited(_updateCategories()); // لا تؤثر على النتيجة مباشرةً
      return right(localCate);
    } catch (e) {
      return left(Failure(errMessage: 'لا يوجد اتصال بالإنترنت ولا توجد بيانات محفوظة'));
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
          return right(AccountModel.fromJson(data));
      },
    );
  }

 
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
              ErrorModel(status: 500, errorMessage: "Empty response from server"),
            );
          }

          // فك البيانات حسب النوع
          final Map<String, dynamic> decoded = raw is String
              ? json.decode(raw)
              : raw as Map<String, dynamic>;

          final deposit = DepositModel.fromJson(decoded);
          return right(deposit);

        } catch (e) {
          print("Error parsing response: $e");
          print("Raw response: ${response.data}");
          throw ServerException(
            ErrorModel(status: 500, errorMessage: "Failed to parse response: $e"),
          );
        }
      },
    );
  } catch (e) {
    print("General error in createDeposit: $e");
    return left(Failure(errMessage: e.toString()));
  }
}

  @override
  Future<Either<Failure, DepositModel>> withdraw(double amount) async{
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
            ErrorModel(status: 500, errorMessage: "Empty response from server"),
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
            ErrorModel(status: 500, errorMessage: "Failed to parse response: $e"),
          );
        }
    },
  );
}  catch (e) {
    return left(Failure(errMessage: e.toString()));}
  }
}

