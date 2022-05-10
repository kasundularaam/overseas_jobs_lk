import 'dart:convert';

class ConnectionUser {
  final String id;
  final String name;
  final String nic;
  final String age;
  final String profession;
  final String email;
  ConnectionUser({
    required this.id,
    required this.name,
    required this.nic,
    required this.age,
    required this.profession,
    required this.email,
  });

  ConnectionUser copyWith({
    String? id,
    String? name,
    String? nic,
    String? age,
    String? profession,
    String? email,
  }) {
    return ConnectionUser(
      id: id ?? this.id,
      name: name ?? this.name,
      nic: nic ?? this.nic,
      age: age ?? this.age,
      profession: profession ?? this.profession,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nic': nic,
      'age': age,
      'profession': profession,
      'email': email,
    };
  }

  factory ConnectionUser.fromMap(Map<String, dynamic> map) {
    return ConnectionUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      nic: map['nic'] ?? '',
      age: map['age'] ?? '',
      profession: map['profession'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectionUser.fromJson(String source) =>
      ConnectionUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConnectionUser(id: $id, name: $name, nic: $nic, age: $age, profession: $profession, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConnectionUser &&
        other.id == id &&
        other.name == name &&
        other.nic == nic &&
        other.age == age &&
        other.profession == profession &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        nic.hashCode ^
        age.hashCode ^
        profession.hashCode ^
        email.hashCode;
  }
}
