import 'package:bank_system/features/home/domain/entites/category_entiey.dart';
import 'package:bank_system/features/home/domain/usecases/category_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.categoryUsecase) : super(HomeInitial());
  final CategoryUsecase categoryUsecase ;
  Future<void> getCategories() async {
    emit(HomeLoading());
    final result = await categoryUsecase.getCategories();
    result.fold(
      (failure) => emit(HomeError(failure.errMessage)),
      (categories) => emit(HomeLoaded(categories)),
    );
  }
}
