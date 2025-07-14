
import 'package:bank_system/features/home/domain/entites/category_entiey.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.categoryName,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'image': image,
    };
  }
}
