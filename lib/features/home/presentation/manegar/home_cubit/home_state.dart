part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<CategoryEntity> categories;

  const HomeLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}
class HomeError extends HomeState {
  final String errMessage;

  const HomeError(this.errMessage);
}
