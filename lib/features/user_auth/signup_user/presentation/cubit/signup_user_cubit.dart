import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_user_state.dart';

class SignupUserCubit extends Cubit<SignupUserState> {
  SignupUserCubit() : super(SignupUserInitial());
}
