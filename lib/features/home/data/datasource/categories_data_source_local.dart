import 'dart:convert';

import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/features/home/data/model/category_model.dart';

class CategoriesDataSourceLocal {
  final CacheHelper cache;
  final String keys = "CacheCategoriesKey";
  CategoriesDataSourceLocal({required this.cache});

  cacheCategories(List<CategoryModel>? azkerToCache) {
    if (azkerToCache != null) {
      cache.saveData(
        key:keys,
        value: json.encode(
          azkerToCache.map((cate)=>cate.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<CategoryModel>> getLastCategories() {
    final jsonString = cache.getDataString(key:keys);

    if (jsonString != null) {
  final List<dynamic> decodedJson = json.decode(jsonString);
    final List<CategoryModel> dataList = decodedJson.map((jsonItem) => CategoryModel.fromJson(jsonItem)).toList();
     
      return Future.value(dataList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}

