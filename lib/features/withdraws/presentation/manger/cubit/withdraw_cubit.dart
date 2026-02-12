import 'package:bank_system/features/deposits/domian/entiites/deposit_entity.dart';
import 'package:bank_system/features/home/domain/usecases/balance_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/withdarw_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  final WithdarwUsecase withdarwUsecase;
  final BalanceUsecase balanceUsecase;
  WithdrawCubit(this.withdarwUsecase, this.balanceUsecase) : super(WithdrawInitial());
  
  final TextEditingController amountController = TextEditingController();

  Future<void> withdraw(double amount) async {
    emit(WithdrawLoading());
    final result = await withdarwUsecase(amount);
    result.fold((failure) => emit(WithdrawError(failure.errMessage)), 
    (withdraw) {
            getBalance();

       emit(WithdrawSuccess(withdraw));});}
   Future<void> getBalance() async {
    emit(BalanceLoading());
    final data = await balanceUsecase();
    data.fold((l) => emit(BalanceError(errMessage: l.errMessage)), (r) {
      getBalance();
      emit(BalanceLoaded(balance: r));
    });
  }

}
