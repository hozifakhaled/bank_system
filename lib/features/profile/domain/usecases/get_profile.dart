import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/profile/domain/entities/user_entity.dart';
import 'package:bank_system/features/profile/domain/repositres/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetProfile {
  final ProfileRepo repo;
  GetProfile(this.repo);

  Future<Either<UserEntity,Failure>> call(String email){
    return repo.getProfile(email);
  }
}