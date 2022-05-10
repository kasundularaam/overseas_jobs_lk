import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/new_user.dart';
import '../../../data/models/ojlk_user.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future register({required NewUser user}) async {
    try {
      emit(RegisterLoading());
      OJLKUser slbfeUser = await Repository.register(newUser: user);
      SharedServices.addUser(nic: slbfeUser.nic, uid: slbfeUser.id);
      emit(RegisterSucceed());
    } catch (e) {
      emit(RegisterFailed(errorMsg: e.toString()));
    }
  }
}
