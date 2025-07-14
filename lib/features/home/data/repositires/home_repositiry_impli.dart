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

  HomeRepositiryImpli({
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
      return right(localCate);
    } catch (e) {
      return left(Failure(errMessage: 'لا يوجد اتصال بالإنترنت ولا توجد بيانات محفوظة'));
    }
  }
}