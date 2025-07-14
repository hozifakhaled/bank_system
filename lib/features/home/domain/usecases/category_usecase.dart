import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/entites/category_entiey.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';

class CategoryUsecase {
  final HomeRepository categoryRepository;

  CategoryUsecase({required this.categoryRepository});

  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return await categoryRepository.getCategories();
  }
}