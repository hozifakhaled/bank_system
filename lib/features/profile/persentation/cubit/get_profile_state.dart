part of 'get_profile_cubit.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final UserEntity profile;
  const GetProfileSuccess(this.profile);
  @override
  List<Object> get props => [profile];
}

final class GetProfileFailure extends GetProfileState {
  final String errorMessage;
  const GetProfileFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
