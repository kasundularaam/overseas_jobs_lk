part of 'complaints_cubit.dart';

@immutable
abstract class ComplaintsState {}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintsLoaded extends ComplaintsState {
  final List<Complaint> complaints;
  ComplaintsLoaded({
    required this.complaints,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComplaintsLoaded &&
        listEquals(other.complaints, complaints);
  }

  @override
  int get hashCode => complaints.hashCode;

  @override
  String toString() => 'ComplaintsLoaded(complaints: $complaints)';
}

class ComplaintsFailed extends ComplaintsState {
  final String errorMsg;
  ComplaintsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComplaintsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ComplaintsFailed(errorMsg: $errorMsg)';
}
