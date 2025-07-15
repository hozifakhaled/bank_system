part of 'balance_cubit.dart';

sealed class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

final class BalanceInitial extends BalanceState {}

final class BalanceLoaded extends BalanceState {
  final double balance;
  const BalanceLoaded({required this.balance});
}

final class BalanceError extends BalanceState {
  final String errMessage;
  const BalanceError({required this.errMessage});

}
final class BalanceLoading extends BalanceState {}
