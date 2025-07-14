
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/features/home/data/model/category_model.dart';

class  CategoriesDataSourceRemote {
  final DioConsumer dioConsumer;
  CategoriesDataSourceRemote({required this.dioConsumer});

  Future<List<CategoryModel>> getAllCategories(

  ) async {
    final response = await dioConsumer.get(
      path: Endpoints.categories,
    
    );
    List<CategoryModel> categoryList = [];
    return response.fold(
      (error) {
         throw ServerException(ErrorModel(
            status: 500, errorMessage: "خطأ في الاتصال: $error"));
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
         for (var item in data.values) {
            categoryList.add(CategoryModel.fromJson(item));
           
          }
           return categoryList;
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
  }

