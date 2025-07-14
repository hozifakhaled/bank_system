import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/endpoints.dart';
import 'package:bank_system/core/errors/error_model.dart';
import 'package:bank_system/core/errors/expentions.dart';
import 'package:bank_system/features/home/data/model/category_model.dart';

class CategoriesDataSourceRemote {
  final DioConsumer dioConsumer;
  CategoriesDataSourceRemote({required this.dioConsumer});

  Future<List<CategoryModel>> getAllCategories() async {
    final response = await dioConsumer.get(
      path: Endpoints.categories,
    );
    
    return response.fold(
      (error) {
        throw ServerException(ErrorModel(
            status: 500, errorMessage: "خطأ في الاتصال: $error"));
      },
      (response) {
        final data = response.data;
        List<CategoryModel> categoryList = [];

        // تحقق من أن البيانات عبارة عن List
        if (data is List) {
          for (var item in data) {
            if (item is Map<String, dynamic>) {
              categoryList.add(CategoryModel.fromJson(item));
            }
          }
          return categoryList;
        } 
        // إذا كانت البيانات Map (في حالة كانت مغلفة)
        else if (data is Map<String, dynamic>) {
          // إذا كانت البيانات مغلفة في key معين
          if (data.containsKey('data') && data['data'] is List) {
            for (var item in data['data']) {
              if (item is Map<String, dynamic>) {
                categoryList.add(CategoryModel.fromJson(item));
              }
            }
            return categoryList;
          }
          // إذا كانت المفاتيح هي البيانات نفسها
          else {
            for (var item in data.values) {
              if (item is Map<String, dynamic>) {
                categoryList.add(CategoryModel.fromJson(item));
              }
            }
            return categoryList;
          }
        } else {
          throw Exception("شكل البيانات غير صحيح: البيانات ليست List أو Map");
        }
      },
    );
  }
}