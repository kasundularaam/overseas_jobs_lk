part of 'ojlk_user_cubit.dart';

@immutable
abstract class OJLKUserState {}

class OJLKUserInitial extends OJLKUserState {}

class OJLKUserLoading extends OJLKUserState {}

class OJLKUserLoaded extends OJLKUserState {
  final OJLKUser user;
  OJLKUserLoaded({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OJLKUserLoaded && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'OJLKUserLoaded(user: $user)';
}

class OJLKUserFailed extends OJLKUserState {
  final String errorMsg;
  OJLKUserFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OJLKUserFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'OJLKUserFailed(errorMsg: $errorMsg)';
}
