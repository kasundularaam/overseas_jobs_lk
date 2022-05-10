import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/connection_user.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'connections_state.dart';

class ConnectionsCubit extends Cubit<ConnectionsState> {
  ConnectionsCubit() : super(ConnectionsInitial());

  Future<void> loadUsers() async {
    try {
      emit(ConnectionsLoading());
      String uid = await SharedServices.getUid();
      List<ConnectionUser> usersList = await Repository.getAllUsers(uid: uid);
      if (usersList.isNotEmpty) {
        emit(ConnectionsLoaded(connectionUsers: usersList));
      } else {
        emit(ConnectionsFailed(errorMsg: "No users available..."));
      }
    } catch (e) {
      emit(ConnectionsFailed(errorMsg: e.toString()));
    }
  }

  Future<void> loadConnections() async {
    try {
      emit(ConnectionsLoading());
      String nic = await SharedServices.getNic();
      List<String> userIds = await Repository.getConnectionIds(nic: nic);
      List<ConnectionUser> usersList =
          await Repository.getConnectUsers(userIds: userIds);
      if (usersList.isNotEmpty) {
        emit(ConnectionsLoaded(connectionUsers: usersList));
      } else {
        emit(ConnectionsFailed(errorMsg: "No connected users available..."));
      }
    } catch (e) {
      emit(ConnectionsFailed(errorMsg: e.toString()));
    }
  }
}
