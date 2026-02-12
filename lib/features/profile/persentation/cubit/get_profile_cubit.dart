import 'package:bank_system/features/profile/domain/entities/user_entity.dart';
import 'package:bank_system/features/profile/domain/usecases/get_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this.getProfile) : super(GetProfileInitial());
  final GetProfile getProfile;

final TextEditingController nameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
  Future<void> getProfileData(String email) async {
    emit(GetProfileLoading());
    final result = await getProfile(email);
    result.fold(
      (profile) => emit(GetProfileSuccess(profile)),
      (failure) => emit(GetProfileFailure(failure.errMessage)),
    );
  }

  String maskAccountNumber(String accountNumber) {
    if (accountNumber.length <= 2) {
      return accountNumber; // لو الرقم أقل من أو يساوي رقمين
    }

    String lastTwo = accountNumber.substring(accountNumber.length - 2);
    String maskedPart = '*' * (accountNumber.length - 2);

    return maskedPart + lastTwo;
  }
}
