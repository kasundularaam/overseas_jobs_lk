part of 'new_complaint_cubit.dart';

@immutable
abstract class NewComplaintState {}

class NewComplaintInitial extends NewComplaintState {}

class NewComplaintLoading extends NewComplaintState {}

class NewComplaintSucceed extends NewComplaintState {}

class NewComplaintFailed extends NewComplaintState {
  final String errorMsg;
  NewComplaintFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewComplaintFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'NewComplaintFailed(errorMsg: $errorMsg)';
}
