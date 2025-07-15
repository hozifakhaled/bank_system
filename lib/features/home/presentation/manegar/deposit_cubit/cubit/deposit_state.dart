part of 'deposit_cubit.dart';

sealed class DepositState extends Equatable {
  const DepositState();

  @override
  List<Object> get props => [];
}

final class DepositInitial extends DepositState {}

final class DepositLoading extends DepositState {}

final class DepositError extends DepositState {
  final String errMessage;
  const DepositError(this.errMessage);
}

final class DepositSuccess extends DepositState {
  final DepositEntity depositEntity;
  const DepositSuccess(this.depositEntity);
}
