import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/hrm.dart';
import '../../../data/repositories/repository.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit() : super(OrganizationInitial());

  Future loadOrganization({required String userId}) async {
    try {
      emit(OrganizationLoading());
      HRM hrm = await Repository.getOrganization(userId: userId);
      emit(OrganizationLoaded(hrm: hrm));
    } catch (e) {
      emit(OrganizationFailed(errorMsg: e.toString()));
    }
  }
}
