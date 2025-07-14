import 'dart:async';

import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_local.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_remote.dart';
import 'package:bank_system/features/home/data/model/category_model.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class HomeRepositiryImpli implements HomeRepository {
  final NetworkInfo networkInfo;
  final CategoriesDataSourceRemote remote;
  final CategoriesDataSourceLocal local;

  HomeRepositiryImpli({required this.networkInfo, required this.remote, required this.local});


  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final localCate = await local.getLastCategories();
   unawaited  ( _updateCategories()); // لا تؤثر على النتيجة مباشرةً
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
      await local.cacheCategories(remoteModel );
    } catch (_) {
      // تجاهل الخطأ بصمت أو سجل لو حبيت
    }
  }
}
}
