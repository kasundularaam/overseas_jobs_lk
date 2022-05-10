import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'connection_state.dart';

class UserConnectionCubit extends Cubit<UserConnectionState> {
  UserConnectionCubit() : super(UserConnectionInitial());

  Future<void> loadConnection({required String connectionId}) async {
    try {
      emit(UserConnectionLoading());
      String nic = await SharedServices.getNic();
      bool isConnected =
          await Repository.isConnected(nic: nic, connectionId: connectionId);
      emit(UserConnectionLoaded(isConnected: isConnected));
    } catch (e) {
      emit(UserConnectionFailed(errorMsg: e.toString()));
    }
  }

  Future<void> connect({required String connectionId}) async {
    try {
      emit(UserConnectionLoading());
      String uid = await SharedServices.getUid();
      await Repository.connect(uid: uid, connectionId: connectionId);
      loadConnection(connectionId: connectionId);
    } catch (e) {
      emit(UserConnectionFailed(errorMsg: e.toString()));
    }
  }

  Future<void> disConnect({required String connectionId}) async {
    try {
      emit(UserConnectionLoading());
      String uid = await SharedServices.getUid();
      await Repository.disConnect(uid: uid, connectionId: connectionId);
      loadConnection(connectionId: connectionId);
    } catch (e) {
      emit(UserConnectionFailed(errorMsg: e.toString()));
    }
  }
}
