import 'dart:convert';

import 'package:flutter/foundation.dart';

class OJLKUser {
  final String id;
  final String name;
  final String nic;
  final String age;
  final String address;
  final String latitude;
  final String longitude;
  final String profession;
  final String email;
  final String affiliation;
  final String password;
  final bool employed;
  final List<String> connections;
  OJLKUser({
    required this.id,
    required this.name,
    required this.nic,
    required this.age,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.profession,
    required this.email,
    required this.affiliation,
    required this.password,
    required this.employed,
    required this.connections,
  });

  OJLKUser copyWith({
    String? id,
    String? name,
    String? nic,
    String? age,
    String? address,
    String? latitude,
    String? longitude,
    String? profession,
    String? email,
    String? affiliation,
    String? password,
    bool? employed,
    List<String>? connections,
  }) {
    return OJLKUser(
      id: id ?? this.id,
      name: name ?? this.name,
      nic: nic ?? this.nic,
      age: age ?? this.age,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      profession: profession ?? this.profession,
      email: email ?? this.email,
      affiliation: affiliation ?? this.affiliation,
      password: password ?? this.password,
      employed: employed ?? this.employed,
      connections: connections ?? this.connections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nic': nic,
      'age': age,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'profession': profession,
      'email': email,
      'affiliation': affiliation,
      'password': password,
      'employed': employed,
      'connections': connections,
    };
  }

  factory OJLKUser.fromMap(Map<String, dynamic> map) {
    return OJLKUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      nic: map['nic'] ?? '',
      age: map['age'] ?? '',
      address: map['address'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      profession: map['profession'] ?? '',
      email: map['email'] ?? '',
      affiliation: map['affiliation'] ?? '',
      password: map['password'] ?? '',
      employed: map['employed'] ?? false,
      connections: map['connections'] != null
          ? List<String>.from(map['connections'])
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OJLKUser.fromJson(String source) =>
      OJLKUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OJLKUser(id: $id, name: $name, nic: $nic, age: $age, address: $address, latitude: $latitude, longitude: $longitude, profession: $profession, email: $email, affiliation: $affiliation, password: $password, employed: $employed, connections: $connections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OJLKUser &&
        other.id == id &&
        other.name == name &&
        other.nic == nic &&
        other.age == age &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.profession == profession &&
        other.email == email &&
        other.affiliation == affiliation &&
        other.password == password &&
        other.employed == employed &&
        listEquals(other.connections, connections);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        nic.hashCode ^
        age.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        profession.hashCode ^
        email.hashCode ^
        affiliation.hashCode ^
        password.hashCode ^
        employed.hashCode ^
        connections.hashCode;
  }
}
