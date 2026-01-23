import 'package:dio/dio.dart';
import 'package:okbarter2/core/globals/globals.dart';
import 'package:okbarter2/core/network/api_service.dart';
import 'package:okbarter2/core/services/tokens.dart';

class AuthRepository extends ApiService {
  sendOtp(phoneNumber) async {
    try {
      final Response response = await apiClient.dio.get(
        "/send-otp/$phoneNumber",
      );

      if (response.statusCode == 200) {
        return;
      }
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }

  verifyOtp({
    required String number,
    required String otp,
    required String deviceId,
    String? deviceType,
  }) async {
    try {
      final Response response = await apiClient.dio.post(
        "/verify-otp",
        data: {
          "number": number,
          "otp": otp,
          "deviceId": deviceId,
          "deviceType": deviceType,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data["data"];

        final String accessToken = data["accessToken"];
        final String refreshToken = data["refreshToken"];

        await Tokens.save(accessToken: accessToken, refreshToken: refreshToken);

        return;
      }
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }

  refreshToken() async {
    try {
      final payload = {"refreshToken": await Tokens.refreshToken};

      final response = await apiClient.dio.post(
        '/refresh-token',
        data: payload,
      );

      final refreshToken = response.data['data']['newRefreshToken'];
      final accessToken = response.data['data']['accessToken'];
      Tokens.save(accessToken: accessToken, refreshToken: refreshToken);
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }
}
