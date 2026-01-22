import 'package:dio/dio.dart';
import 'package:okbarter2/core/errors/exceptions.dart';
import 'package:okbarter2/core/globals/globals.dart';
import 'package:okbarter2/core/network/api_service.dart';
import 'package:okbarter2/core/network/network_exceptions.dart';

class AuthRepository extends ApiService {
  sendOtp(phoneNumber) async {
    try {
      final Response response = await apiClient.dio.get(
        "/send-otp/$phoneNumber",
      );

      if (response.statusCode == 200) {
        return;
      }
      
    } on NetworkException catch (e) {
      if (e.type == NetworkErrorType.noInternet) {
        throw NoInternetException();
      }

      if (e.type == NetworkErrorType.unauthorised) {
        throw UnauthorizedUser();
      }
      rethrow;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
