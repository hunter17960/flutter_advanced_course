import 'package:flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<LoginRepo>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }

    // await _apiService.login(LoginRequestBody(email: email, password: password));
  }
}
