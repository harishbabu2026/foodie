import 'dart:convert';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        phone: map['phone'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "password": password
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel cloneWith({
    id,
    name,
    email,
    phone,
    password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
