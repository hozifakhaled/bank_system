import 'package:bank_system/features/home/domain/usecases/balance_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit(this.balanceUsecase) : super(BalanceInitial());

  final BalanceUsecase balanceUsecase;
  Future<void> getBalance() async {
    emit(BalanceLoading());
    final data = await balanceUsecase();
    data.fold(
      (l) => emit(BalanceError(errMessage: l.errMessage)),
      (r) => emit(BalanceLoaded(balance: r)),
    );
  }
}
