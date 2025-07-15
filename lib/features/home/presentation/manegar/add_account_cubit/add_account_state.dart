part of 'add_account_cubit.dart';

sealed class AddAccountState extends Equatable {
  const AddAccountState();

  @override
  List<Object> get props => [];
}

final class AddAccountInitial extends AddAccountState {}

final class AddAccountLoadingState extends AddAccountState {}

final class AddAccountErrorState extends AddAccountState {
  
  final String message;
  const AddAccountErrorState(this.message);
}

final class AddAccountSuccessState extends AddAccountState {
  final AccountEntity account;
  const AddAccountSuccessState(this.account);
}
