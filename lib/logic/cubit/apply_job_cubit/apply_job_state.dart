part of 'apply_job_cubit.dart';

@immutable
abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}

class ApplyJobLoading extends ApplyJobState {}

class ApplyJobApply extends ApplyJobState {}

class ApplyJobApplied extends ApplyJobState {}

class ApplyJobFailed extends ApplyJobState {
  final String errorMsg;
  ApplyJobFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApplyJobFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ApplyJobFailed(errorMsg: $errorMsg)';
}
