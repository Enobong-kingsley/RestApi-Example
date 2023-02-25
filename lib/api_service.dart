import 'dart:convert';

import 'package:rest_api_example/api_constants.dart';
import 'package:rest_api_example/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
//   void UserModel() async {
//     var urlString = await http.get(Uri.https("random-data-api.com", "users"));
//     if (urlString.statusCode == 200) {
//       var model = jsonDecode(urlString.body);
//       print(model)
//     }
//   }

  Future<List<UserModel>?> getUsers() async {
    try {
      var urlString = await http.get(Uri.https("random-data-api.com", "users"));

      //var response = await http.get(url);
      if (urlString.statusCode == 200) {
        var model = jsonDecode(urlString.body);
        print(model);

        //List<UserModel> _model = UserModelFromJson(response.body);
        //return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
