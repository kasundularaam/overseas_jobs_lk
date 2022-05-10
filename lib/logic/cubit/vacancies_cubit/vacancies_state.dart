part of 'vacancies_cubit.dart';

@immutable
abstract class VacanciesState {}

class VacanciesInitial extends VacanciesState {}

class VacanciesLoading extends VacanciesState {}

class VacanciesLoaded extends VacanciesState {
  final List<Vacancy> vacancies;
  VacanciesLoaded({
    required this.vacancies,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VacanciesLoaded && listEquals(other.vacancies, vacancies);
  }

  @override
  int get hashCode => vacancies.hashCode;

  @override
  String toString() => 'VacanciesLoaded(vacancies: $vacancies)';
}

class VacanciesFailed extends VacanciesState {
  final String errorMsg;
  VacanciesFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VacanciesFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'VacanciesFailed(errorMsg: $errorMsg)';
}
