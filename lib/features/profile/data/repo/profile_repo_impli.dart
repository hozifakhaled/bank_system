import 'dart:async';

import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/profile/data/datasources/get_profile_data_source_local.dart';
import 'package:bank_system/features/profile/data/datasources/get_profile_data_source_remote.dart';
import 'package:bank_system/features/profile/data/model/user_profile_model.dart';
import 'package:bank_system/features/profile/domain/repositres/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepoImpli implements ProfileRepo {
  final NetworkInfo networkInfo;
  final GetProfileDataSourceRemote remote;
  final GetProfileDataSourceLocal local;
  ProfileRepoImpli(this.networkInfo, this.remote, this.local);
  @override
  Future<Either<UserModel, Failure>> getProfile(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteModel = await remote.getprofile(email);

        await local.cacheProfile(remoteModel);

        return left(remoteModel);
      } on ServerException {
        return _getFromLocal();
      } catch (e) {
        return right(Failure(errMessage: '$e'));
      }
    } else {
      return _getFromLocal();
    }
  }

  Future<Either<UserModel, Failure>> _getFromLocal() async {
    try {
      final localCate = await local.getprofilelocal();
      return left(localCate);
    } catch (e) {
      return right(
        Failure(errMessage: 'لا يوجد اتصال بالإنترنت ولا توجد بيانات محفوظة'),
      );
    }
  }
}
