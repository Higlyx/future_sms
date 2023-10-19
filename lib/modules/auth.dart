import 'dart:convert';

import 'package:future_sms/modules/phone_number.dart';

class AuthModule {
  final PhoneNumberModule phone;
  final String password;
  AuthModule({
    required this.phone,
    required this.password,
  });

  AuthModule copyWith({
    PhoneNumberModule? phone,
    String? password,
  }) {
    return AuthModule(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone.toMap(),
      'password': password,
    };
  }

  factory AuthModule.fromMap(Map<String, dynamic> map) {
    return AuthModule(
      phone: PhoneNumberModule.fromMap(map['phone'] as Map<String, dynamic>),
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModule.fromJson(String source) =>
      AuthModule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthModule(phone: $phone, password: $password)';

  @override
  bool operator ==(covariant AuthModule other) {
    if (identical(this, other)) return true;

    return other.phone == phone && other.password == password;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode;
}
