import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/vacancy.dart';
import '../../../data/repositories/repository.dart';

part 'vacancies_state.dart';

class VacanciesCubit extends Cubit<VacanciesState> {
  VacanciesCubit() : super(VacanciesInitial());

  Future loadVacancies() async {
    try {
      emit(VacanciesLoading());
      List<Vacancy> vacancies = await Repository.getVacancies();
      emit(VacanciesLoaded(vacancies: vacancies));
    } catch (e) {
      emit(VacanciesFailed(errorMsg: e.toString()));
    }
  }
}
