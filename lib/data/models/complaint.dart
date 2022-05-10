import 'dart:convert';

class Complaint {
  final String id;
  final String userId;
  final String complaintMessage;
  final String respondedUserId;
  final String responseMessage;
  Complaint({
    required this.id,
    required this.userId,
    required this.complaintMessage,
    required this.respondedUserId,
    required this.responseMessage,
  });

  Complaint copyWith({
    String? id,
    String? userId,
    String? complaintMessage,
    String? respondedUserId,
    String? responseMessage,
  }) {
    return Complaint(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      complaintMessage: complaintMessage ?? this.complaintMessage,
      respondedUserId: respondedUserId ?? this.respondedUserId,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'complaintMessage': complaintMessage,
      'respondedUserId': respondedUserId,
      'responseMessage': responseMessage,
    };
  }

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      complaintMessage: map['complaintMessage'] ?? '',
      respondedUserId: map['respondedUserId'] ?? '',
      responseMessage: map['responseMessage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Complaint.fromJson(String source) =>
      Complaint.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Complaint(id: $id, userId: $userId, complaintMessage: $complaintMessage, respondedUserId: $respondedUserId, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Complaint &&
        other.id == id &&
        other.userId == userId &&
        other.complaintMessage == complaintMessage &&
        other.respondedUserId == respondedUserId &&
        other.responseMessage == responseMessage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        complaintMessage.hashCode ^
        respondedUserId.hashCode ^
        responseMessage.hashCode;
  }
}
