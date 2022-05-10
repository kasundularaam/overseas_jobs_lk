part of 'organization_cubit.dart';

@immutable
abstract class OrganizationState {}

class OrganizationInitial extends OrganizationState {}

class OrganizationLoading extends OrganizationState {}

class OrganizationLoaded extends OrganizationState {
  final HRM hrm;
  OrganizationLoaded({
    required this.hrm,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrganizationLoaded && other.hrm == hrm;
  }

  @override
  int get hashCode => hrm.hashCode;

  @override
  String toString() => 'OrganizationLoaded(hrm: $hrm)';
}

class OrganizationFailed extends OrganizationState {
  final String errorMsg;
  OrganizationFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrganizationFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'OrganizationFailed(errorMsg: $errorMsg)';
}
