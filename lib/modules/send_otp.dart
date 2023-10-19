import 'dart:convert';
import 'package:future_sms/modules/api_base_response.dart';
import 'package:future_sms/modules/phone_number.dart';

class SendOTPModule {
  final String event = 'send_otp';
  final PhoneNumberModule phoneNumberModule;

  /// Custom text to send it with the OTP code 'optional'
  final String? customText;
  SendOTPModule({
    required this.phoneNumberModule,
    this.customText,
  });

  SendOTPModule copyWith({
    String? event,
    PhoneNumberModule? phoneNumberModule,
    String? customText,
  }) {
    return SendOTPModule(
      phoneNumberModule: phoneNumberModule ?? this.phoneNumberModule,
      customText: customText ?? this.customText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'event': event,
      'data': {
        'number': phoneNumberModule.toMap(),
        'customText': customText,
      }
    };
  }

  factory SendOTPModule.fromMap(Map<String, dynamic> map) {
    return SendOTPModule(
      phoneNumberModule: PhoneNumberModule.fromMap(
          map['phoneNumberModule'] as Map<String, dynamic>),
      customText: map['customText'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendOTPModule.fromJson(String source) =>
      SendOTPModule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SendOTPModule(event: $event, phoneNumberModule: $phoneNumberModule, customText: $customText)';

  @override
  bool operator ==(covariant SendOTPModule other) {
    if (identical(this, other)) return true;

    return other.event == event &&
        other.phoneNumberModule == phoneNumberModule &&
        other.customText == customText;
  }

  @override
  int get hashCode =>
      event.hashCode ^ phoneNumberModule.hashCode ^ customText.hashCode;
}

class ResponseSendOTPModule extends APIBaseResponse {
  String? responseMessage;
  String? verificationID;

  ResponseSendOTPModule({
    this.responseMessage,
    this.verificationID,
  }) : super(message: responseMessage);

  factory ResponseSendOTPModule.fromMap(Map<String, dynamic> map) {
    return ResponseSendOTPModule(
      responseMessage: map['message'] as String?,
      verificationID: map['verificationID'] as String?,
    );
  }
}
