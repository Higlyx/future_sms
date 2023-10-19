import 'package:dio/dio.dart';
import 'package:future_sms/modules/phone_number.dart';
import 'package:future_sms/modules/send_otp.dart';
import 'package:future_sms/modules/verify_otp.dart';
import 'package:future_sms/src/api.dart';

class FutureSMS {
  FutureSMS._() {
    if (_token == null || _token!.isEmpty) {
      throw Exception('Token is not initlized');
    }
  }
  static String? _token;

  /// Initlize the token in the main function before run the app
  static void initlize({required String token}) {
    _token = token;
  }

  static final FutureSMS _instance = FutureSMS._();
  static FutureSMS get instance => _instance;

  /// Send OTP to the user phone number and return the verificationID to use it in the verifyOTP function
  /// * [countryCode] must be '+20'
  /// * [phoneNumber] must be 10 digits
  /// * [customText] is optional, you can use it to send custom text with the OTP code
  Future<ResponseSendOTPModule> sendOTP(
      {required String countryCode,
      required String phoneNumber,
      String? customText}) async {
    if (countryCode != '+20') {
      throw Exception('Country code must be +20');
    }
    if (phoneNumber.length != 10) {
      throw Exception('Phone number must be 10 digits');
    }
    try {
      var sendOTPModule = SendOTPModule(
        phoneNumberModule: PhoneNumberModule(
            countryCode: countryCode, phoneNumber: phoneNumber),
        customText: customText,
      );

      var request = await API.sendOTP(_token!, sendOTPModule);

      if (request.statusCode == 200) {
        return ResponseSendOTPModule.fromMap(request.data);
      } else {
        throw DioException(
            requestOptions: request.requestOptions, response: request);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseVerifyOTPModule> verifyOTP({
    required String otp,
    required String verificationID,

    /// Optional, used when you want to return firebase custom token
    String? userUID,
  }) async {
    try {
      var verifyOTPModule = VerifyOTPModule(
        data: VerifyOTPDataModule(
            otp: otp, verificationID: verificationID, userUID: userUID),
      );

      var request = await API.verifyOTP(_token!, verifyOTPModule);

      if (request.statusCode == 200) {
        return ResponseVerifyOTPModule.fromMap(request.data);
      } else {
        throw DioException(
            requestOptions: request.requestOptions, response: request);
      }
    } catch (e) {
      rethrow;
    }
  }
}
