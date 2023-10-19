import 'dart:io';

import 'package:dio/dio.dart'
    show BaseOptions, Dio, DioException, Response, ResponseType;
import 'package:future_sms/modules/send_otp.dart';
import 'package:future_sms/modules/verify_otp.dart';
import 'package:future_sms/utils/logg.dart';

class API {
  API._();

  static const String baseUrl = 'https://sms.kar1mmohamed.com';

  static Dio dio(String token) => Dio(
        BaseOptions(
            baseUrl: baseUrl,
            responseType: ResponseType.json,
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}),
      );

  static Future<Response> sendOTP(
      String token, SendOTPModule sendOTPModule) async {
    try {
      var request = await dio(token).post(
        '/send',
        data: sendOTPModule.toMap(),
      );

      logg(request.requestOptions.data);

      logg(request.data);
      return request;
    } on DioException catch (e) {
      logg('Error: ${e.response?.data?['meesage']}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> verifyOTP(
      String token, VerifyOTPModule verifyOTPModule) async {
    try {
      var request = await dio(token).post(
        '/verify-otp',
        data: verifyOTPModule.toMap(),
      );

      logg(request.requestOptions.data);

      logg(request.data);
      return request;
    } on DioException catch (e) {
      logg('Error: ${e.response?.data?['message']}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
