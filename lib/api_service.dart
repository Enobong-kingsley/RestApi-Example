import 'package:rest_api_example/api_constants.dart';
import 'package:rest_api_example/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = UserModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
