import 'package:bank_system/features/home/domain/entites/deposit_entity.dart';
import 'package:bank_system/features/home/domain/usecases/deposit_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  final DepositUsecase depositUsecase;
  DepositCubit(this.depositUsecase) : super(DepositInitial());

  final TextEditingController amountController = TextEditingController();

  Future<void> createDeposit(double amount) async {
    emit(DepositLoading());
    final result = await depositUsecase(amount);
    result.fold((failure) => emit(DepositError(failure.errMessage)), (deposit) => emit(DepositSuccess(deposit)));
  }

  
}
