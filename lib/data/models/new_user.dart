import 'dart:convert';

class NewUser {
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
  NewUser({
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
  });

  NewUser copyWith({
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
  }) {
    return NewUser(
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
    };
  }

  factory NewUser.fromMap(Map<String, dynamic> map) {
    return NewUser(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUser.fromJson(String source) =>
      NewUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewUser(name: $name, nic: $nic, age: $age, address: $address, latitude: $latitude, longitude: $longitude, profession: $profession, email: $email, affiliation: $affiliation, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewUser &&
        other.name == name &&
        other.nic == nic &&
        other.age == age &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.profession == profession &&
        other.email == email &&
        other.affiliation == affiliation &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        nic.hashCode ^
        age.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        profession.hashCode ^
        email.hashCode ^
        affiliation.hashCode ^
        password.hashCode;
  }
}
