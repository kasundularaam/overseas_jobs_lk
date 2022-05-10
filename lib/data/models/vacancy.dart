import 'dart:convert';

import 'package:flutter/foundation.dart';

class Vacancy {
  final String id;
  final String jobTitle;
  final String jobDescription;
  final bool isApproved;
  final String userId;
  final List<String> candidates;
  final String deadline;
  Vacancy({
    required this.id,
    required this.jobTitle,
    required this.jobDescription,
    required this.isApproved,
    required this.userId,
    required this.candidates,
    required this.deadline,
  });

  Vacancy copyWith({
    String? id,
    String? jobTitle,
    String? jobDescription,
    bool? isApproved,
    String? userId,
    List<String>? candidates,
    String? deadline,
  }) {
    return Vacancy(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      jobDescription: jobDescription ?? this.jobDescription,
      isApproved: isApproved ?? this.isApproved,
      userId: userId ?? this.userId,
      candidates: candidates ?? this.candidates,
      deadline: deadline ?? this.deadline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'isApproved': isApproved,
      'userId': userId,
      'candidates': candidates,
      'deadline': deadline,
    };
  }

  factory Vacancy.fromMap(Map<String, dynamic> map) {
    return Vacancy(
      id: map['id'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      jobDescription: map['jobDescription'] ?? '',
      isApproved: map['isApproved'] ?? false,
      userId: map['userId'] ?? '',
      candidates:
          map['candidates'] != null ? List<String>.from(map['candidates']) : [],
      deadline: map['deadline'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vacancy.fromJson(String source) =>
      Vacancy.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vacancy(id: $id, jobTitle: $jobTitle, jobDescription: $jobDescription, isApproved: $isApproved, userId: $userId, candidates: $candidates, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vacancy &&
        other.id == id &&
        other.jobTitle == jobTitle &&
        other.jobDescription == jobDescription &&
        other.isApproved == isApproved &&
        other.userId == userId &&
        listEquals(other.candidates, candidates) &&
        other.deadline == deadline;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        jobTitle.hashCode ^
        jobDescription.hashCode ^
        isApproved.hashCode ^
        userId.hashCode ^
        candidates.hashCode ^
        deadline.hashCode;
  }
}
