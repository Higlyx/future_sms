import 'dart:convert';

class PhoneNumberModule {
  final String countryCode;
  final String phoneNumber;
  PhoneNumberModule({
    required this.countryCode,
    required this.phoneNumber,
  }) {
    if (countryCode != '+20') {
      throw Exception('countryCode must be +20');
    }
    if (phoneNumber.length != 10) {
      throw Exception('phoneNumber must be 10 digits');
    }
  }

  PhoneNumberModule copyWith({
    String? countryCode,
    String? phoneNumber,
  }) {
    return PhoneNumberModule(
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
    };
  }

  factory PhoneNumberModule.fromMap(Map<String, dynamic> map) {
    return PhoneNumberModule(
      countryCode: map['countryCode'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneNumberModule.fromJson(String source) =>
      PhoneNumberModule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PhoneNumberModule(countryCode: $countryCode, phoneNumber: $phoneNumber)';

  @override
  bool operator ==(covariant PhoneNumberModule other) {
    if (identical(this, other)) return true;

    return other.countryCode == countryCode && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => countryCode.hashCode ^ phoneNumber.hashCode;
}
