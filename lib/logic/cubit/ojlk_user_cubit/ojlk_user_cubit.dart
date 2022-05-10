import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/ojlk_user.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'ojlk_user_state.dart';

class OJLKUserCubit extends Cubit<OJLKUserState> {
  OJLKUserCubit() : super(OJLKUserInitial());

  Future getUser() async {
    try {
      emit(OJLKUserLoading());
      final String nic = await SharedServices.getNic();
      OJLKUser user = await Repository.getSlbfeUser(nic: nic);
      emit(OJLKUserLoaded(user: user));
    } catch (e) {
      emit(OJLKUserFailed(errorMsg: e.toString()));
    }
  }
}
