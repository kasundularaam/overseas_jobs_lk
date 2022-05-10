part of 'connections_cubit.dart';

@immutable
abstract class ConnectionsState {}

class ConnectionsInitial extends ConnectionsState {}

class ConnectionsLoading extends ConnectionsState {}

class ConnectionsLoaded extends ConnectionsState {
  final List<ConnectionUser> connectionUsers;
  ConnectionsLoaded({
    required this.connectionUsers,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConnectionsLoaded &&
        listEquals(other.connectionUsers, connectionUsers);
  }

  @override
  int get hashCode => connectionUsers.hashCode;

  @override
  String toString() => 'ConnectionsLoaded(connectionUsers: $connectionUsers)';
}

class ConnectionsFailed extends ConnectionsState {
  final String errorMsg;
  ConnectionsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConnectionsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ConnectionsFailed(errorMsg: $errorMsg)';
}
