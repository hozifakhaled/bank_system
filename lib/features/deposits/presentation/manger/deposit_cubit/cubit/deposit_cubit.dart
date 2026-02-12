import 'package:bank_system/features/deposits/domian/entiites/deposit_entity.dart';
import 'package:bank_system/features/deposits/domian/usecase/deposit_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/balance_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  final DepositUsecase depositUsecase;
  final BalanceUsecase balanceUsecase;

  DepositCubit(this.depositUsecase, this.balanceUsecase)
    : super(DepositInitial());

  final TextEditingController amountController = TextEditingController();

  Future<void> createDeposit(double amount) async {
    emit(DepositLoading());
    final result = await depositUsecase(amount);
    result.fold(
      (failure) => emit(DepositError(failure.errMessage)),
      (deposit) => emit(DepositSuccess(deposit)),
    );
  }

  Future<void> getBalance() async {
    emit(BalanceLoading());
    final data = await balanceUsecase();
    data.fold((l) => emit(BalanceError(errMessage: l.errMessage)), (r) {
      getBalance();
      emit(BalanceLoaded(balance: r));
    });
  }
}
