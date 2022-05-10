part of 'connection_cubit.dart';

@immutable
abstract class UserConnectionState {}

class UserConnectionInitial extends UserConnectionState {}

class UserConnectionLoading extends UserConnectionState {}

class UserConnectionLoaded extends UserConnectionState {
  final bool isConnected;
  UserConnectionLoaded({
    required this.isConnected,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserConnectionLoaded && other.isConnected == isConnected;
  }

  @override
  int get hashCode => isConnected.hashCode;

  @override
  String toString() => 'UserConnectionLoaded(isConnected: $isConnected)';
}

class UserConnectionFailed extends UserConnectionState {
  final String errorMsg;
  UserConnectionFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserConnectionFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'UserConnectionFailed(errorMsg: $errorMsg)';
}
