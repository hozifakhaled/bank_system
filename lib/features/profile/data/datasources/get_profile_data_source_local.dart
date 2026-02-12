import 'dart:convert';

import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/features/profile/data/model/user_profile_model.dart';

class GetProfileDataSourceLocal {
  final CacheHelper cache;
  final String keys = "getprofile";
  GetProfileDataSourceLocal({required this.cache});

  cacheProfile(UserModel? user) {
    if (user != null) {
      cache.saveData(
        key:keys,
        value: json.encode(
          user.toJson()),
        
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel> getprofilelocal() {
    final jsonString = cache.getDataString(key:keys);

    if (jsonString != null) {
  final  decodedJson = json.decode(jsonString);
     
      return Future.value(decodedJson);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}

