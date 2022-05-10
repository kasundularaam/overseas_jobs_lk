import '../../core/constants/configs.dart';

class DataProvider {
  static String getSlbfeUserUrl({required String nic}) =>
      "${Configs.baseUrl}/api/Citizens/$nic.js";

  static String getCitizenById({required String uid}) =>
      "${Configs.baseUrl}/api/Citizens/GetCitizenById/$uid.js";

  static String verifyInfoUrl({required String nic}) =>
      "${Configs.baseUrl}/api/Citizens/VerifyInformation/$nic.js";

  static String uploadDocsUrl({required String nic}) =>
      "${Configs.baseUrl}/api/Citizens/$nic.js";

  static String get newUserUrl => "${Configs.baseUrl}/api/Citizens.js";

  static String loginUserUrl({required String nic, required String password}) =>
      "${Configs.baseUrl}/api/Citizens/LoginUser/$nic/$password.js";

  static String getComplaintsUrl({required String uid}) =>
      "${Configs.baseUrl}/api/Complaint/GetByUserId/$uid.js";

  static String get newComplaintUrl => "${Configs.baseUrl}/api/Complaint/.js";

  static String get allCitizens => "${Configs.baseUrl}/api/Citizens/.js";

  static String handleConnection(
          {required String connectionId, required String uid}) =>
      "${Configs.baseUrl}/api/Citizens/Connection/$connectionId/$uid.js";

  static String get vacancies => "${Configs.baseUrl}/api/Vacancies/.js";

  static String getOrganizationUrl({required String userId}) =>
      "${Configs.baseUrl}/api/Users/GetById/$userId.js";

  static String get applyForJobVacancyUrl =>
      "${Configs.baseUrl}/api/Vacancies/ApplyForJobVacancy.js";

  static String getVacanciesForCitizenIdUrl({required String uid}) =>
      "${Configs.baseUrl}/api/Vacancies/GetAllVacanciesForCitizensId/$uid.js";
}
