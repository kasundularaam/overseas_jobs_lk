import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/vacancy.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit() : super(ApplyJobInitial());

  Future load({required String vacancyId}) async {
    try {
      emit(ApplyJobLoading());
      String uid = await SharedServices.getUid();
      List<Vacancy> appliedJobs =
          await Repository.getVacanciesByCitizen(uid: uid);
      bool applied = false;
      appliedJobs
          .map((vacancy) => {if (vacancy.id == vacancyId) applied = true})
          .toList();
      if (applied) {
        emit(ApplyJobApplied());
      } else {
        emit(ApplyJobApply());
      }
    } catch (e) {
      emit(ApplyJobFailed(errorMsg: e.toString()));
    }
  }

  Future apply({required String vacancyId}) async {
    try {
      emit(ApplyJobLoading());
      String uid = await SharedServices.getUid();
      bool applied =
          await Repository.applyJob(citizenId: uid, vacancyId: vacancyId);

      if (applied) {
        load(vacancyId: vacancyId);
      } else {
        emit(ApplyJobFailed(errorMsg: "Can not apply."));
      }
    } catch (e) {
      emit(ApplyJobFailed(errorMsg: e.toString()));
    }
  }
}
