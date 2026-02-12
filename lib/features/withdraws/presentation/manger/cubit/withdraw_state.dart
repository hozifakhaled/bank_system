part of 'withdraw_cubit.dart';

sealed class WithdrawState extends Equatable {
  const WithdrawState();

  @override
  List<Object> get props => [];
}

final class WithdrawInitial extends WithdrawState {}
final class WithdrawLoading extends WithdrawState {}
final class WithdrawSuccess extends WithdrawState {
  final DepositEntity withdraw;
  const WithdrawSuccess(this.withdraw);

  @override
  List<Object> get props => [withdraw];
}

final class WithdrawError extends WithdrawState {
  final String errMessage;
  const WithdrawError(this.errMessage);
}

final class BalanceLoading extends WithdrawState {}

final class BalanceError extends WithdrawState {
  final String errMessage;
  const BalanceError({required this.errMessage});
}

final class BalanceLoaded extends WithdrawState {
  final double balance;
  const BalanceLoaded({required this.balance});
}

