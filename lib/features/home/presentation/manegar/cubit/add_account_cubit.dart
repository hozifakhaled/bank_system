import 'package:bank_system/features/home/domain/entites/accounts_entity.dart';
import 'package:bank_system/features/home/domain/usecases/add_account_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  AddAccountCubit(this.addAccountUsecase) : super(AddAccountInitial());
  final AddAccountUsecase addAccountUsecase ;

  Future<void> addAccount(String accountType) async {
    emit(AddAccountLoadingState());
    final result = await addAccountUsecase(accountType);
    result.fold((failure) => emit(AddAccountErrorState(failure.errMessage)),
        (account) => emit(AddAccountSuccessState(account)));
  }
}
