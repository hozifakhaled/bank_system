import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitial());
}
