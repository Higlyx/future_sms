import 'dart:convert';

import 'package:future_sms/modules/api_base_response.dart';

class VerifyOTPModule {
  final String event = 'verify_otp';
  final VerifyOTPDataModule data;
  VerifyOTPModule({
    required this.data,
  });

  VerifyOTPModule copyWith({
    VerifyOTPDataModule? data,
  }) {
    return VerifyOTPModule(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'event': event,
      'data': data.toMap(),
    };
  }

  factory VerifyOTPModule.fromMap(Map<String, dynamic> map) {
    return VerifyOTPModule(
      data: VerifyOTPDataModule.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOTPModule.fromJson(String source) =>
      VerifyOTPModule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerifyOTPModule(event: $event, data: $data)';

  @override
  bool operator ==(covariant VerifyOTPModule other) {
    if (identical(this, other)) return true;

    return other.event == event && other.data == data;
  }

  @override
  int get hashCode => event.hashCode ^ data.hashCode;
}

class VerifyOTPDataModule {
  final String otp;
  final String verificationID;
  final String? userUID;
  VerifyOTPDataModule({
    required this.otp,
    required this.verificationID,
    this.userUID,
  });

  VerifyOTPDataModule copyWith({
    String? otp,
    String? verificationID,
    String? userUID,
  }) {
    return VerifyOTPDataModule(
      otp: otp ?? this.otp,
      verificationID: verificationID ?? this.verificationID,
      userUID: userUID ?? this.userUID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'otp': otp,
      'verificationID': verificationID,
      'userUID': userUID,
    };
  }

  factory VerifyOTPDataModule.fromMap(Map<String, dynamic> map) {
    return VerifyOTPDataModule(
      otp: map['otp'] as String,
      verificationID: map['verificationID'] as String,
      userUID: map['userUID'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOTPDataModule.fromJson(String source) =>
      VerifyOTPDataModule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'VerifyOTPDataModule(otp: $otp, verificationID: $verificationID, userUID: $userUID)';

  @override
  bool operator ==(covariant VerifyOTPDataModule other) {
    if (identical(this, other)) return true;

    return other.otp == otp &&
        other.verificationID == verificationID &&
        other.userUID == userUID;
  }

  @override
  int get hashCode => otp.hashCode ^ verificationID.hashCode ^ userUID.hashCode;
}

class ResponseVerifyOTPModule extends APIBaseResponse {
  @override
  // ignore: overridden_fields
  final String message;

  /// This is firebase custom token used to login with custom token in firebase , it returns null if the firebase service account is not set
  final String? token;

  final bool? isVerified;

  ResponseVerifyOTPModule({
    required this.message,
    this.token,
    this.isVerified,
  }) : super(message: message);

  factory ResponseVerifyOTPModule.fromMap(Map<String, dynamic> map) {
    return ResponseVerifyOTPModule(
      message: map['message'] as String,
      isVerified: map['isVerified'] as bool?,
      token: map['token'] as String?,
    );
  }
}
