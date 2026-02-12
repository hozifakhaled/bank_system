import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/features/profile/data/model/user_profile_model.dart';

class   GetProfileDataSourceRemote {
  final DioConsumer dioConsumer;
  GetProfileDataSourceRemote({required this.dioConsumer});

  Future<UserModel> getprofile(String email) async {
    final response = await dioConsumer.get(
      path: Endpoints.getProile(email),
    );
    
    return response.fold(
      (error) {
        throw ServerException(ErrorModel(
            status: 500, errorMessage: "error  : $error"));
      },
      (response) {
        if (response.statusCode==200) {
         final data = response.data;
             return UserModel.fromJson(data);

        }else{
          throw ServerException(ErrorModel(
            status: response.statusCode??500, errorMessage: "error  : ${response.statusMessage}"));
        }

      
      },
    );
  }
}