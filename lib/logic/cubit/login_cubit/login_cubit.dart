import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/ojlk_user.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login({required String nic, required String password}) async {
    try {
      emit(LoginLoading());
      bool succeed = await Repository.login(nic: nic, password: password);
      if (succeed) {
        OJLKUser user = await Repository.getSlbfeUser(nic: nic);
        SharedServices.addUser(nic: nic, uid: user.id);
        emit(LoginSucceed());
      } else {
        emit(LoginFailed(errorMsg: "Wrong credentials"));
      }
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
