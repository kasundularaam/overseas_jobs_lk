import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'new_complaint_state.dart';

class NewComplaintCubit extends Cubit<NewComplaintState> {
  NewComplaintCubit() : super(NewComplaintInitial());

  Future addComplaint({required String message}) async {
    try {
      final String uid = await SharedServices.getUid();
      emit(NewComplaintLoading());
      bool succeed = await Repository.addComplaint(uid: uid, message: message);
      if (succeed) {
        emit(NewComplaintSucceed());
      } else {
        emit(NewComplaintFailed(errorMsg: "Something went wrong"));
      }
      emit(NewComplaintSucceed());
    } catch (e) {
      emit(NewComplaintFailed(errorMsg: e.toString()));
    }
  }
}
