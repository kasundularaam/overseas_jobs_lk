import 'dart:convert';

import '../../data/models/complaint.dart';
import '../../data/models/connection_user.dart';
import '../../data/models/vacancy.dart';

class HttpListConverter {
  static List<Complaint> parseComplaints(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Complaint>(
          (json) => Complaint.fromMap(json),
        )
        .toList();
  }

  static List<ConnectionUser> parseAllUsers(String responseBody, String uid) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<ConnectionUser> allUsers = parsed
        .map<ConnectionUser>(
          (json) => ConnectionUser.fromMap(json),
        )
        .toList();
    List<ConnectionUser> filteredUsers = [];
    allUsers.map((e) {
      if (e.id != uid) {
        filteredUsers.add(e);
      }
    }).toList();
    return filteredUsers;
  }

  static List<Vacancy> parseVacancies(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Vacancy>(
          (json) => Vacancy.fromMap(json),
        )
        .toList();
  }
}
