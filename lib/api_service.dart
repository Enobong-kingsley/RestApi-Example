import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rest_api_example/user_model.dart';

class ApiService {
  Future<List<UserModel>> getUsers() async {
    try {
      final response =
          await http.get(Uri.https("random-data-api.com", "api/v2/users"));
      return [UserModelFromJson(response.body)];
    } catch (e) {
      log("exception caught from fetching users is ${e.toString()}");
      throw UsersNotFoundException(
          "failed to fetch user data at this time, please try again later");
    }
  }
}

class UsersNotFoundException implements Exception {
  final String exception;

  UsersNotFoundException(this.exception);
}

// Something for more advanced cases
class ApiResponseWrapper<T> {
  final bool isLoading;
  final T? data;
  final String? errorMessage;

  ApiResponseWrapper({this.isLoading = false, this.data, this.errorMessage});

  ApiResponseWrapper<T> copyWith(
      {bool? isLoading, T? data, String? errorMessage}) {
    return ApiResponseWrapper(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
