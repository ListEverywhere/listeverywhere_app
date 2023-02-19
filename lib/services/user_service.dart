import 'dart:convert';

import 'package:listeverywhere_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String _url = 'http://localhost:8080/users';

  Future sendRegisterData(UserModel user) async {
    var userJson = jsonEncode(user.toJson());
    print(userJson);

    var response = await http
        .post(
          Uri.parse('$_url/'),
          headers: {'Content-Type': 'application/json'},
          body: userJson,
        )
        .timeout(const Duration(seconds: 2));

    print(response);

    if (response.statusCode == 403) {
      return Future.error(Exception('Forbidden!'));
    }

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data['message']);
      return data['message'];
    } else {
      print("Error: ${data['message']}");
      return Future.error(Exception(data['message']));
    }
  }

  Future login(String username, String password) async {
    var loginData = jsonEncode({'username': username, 'password': password});
    print('Logging in with $loginData');

    var response = await http
        .post(
          Uri.parse('$_url/login/'),
          headers: {'Content-Type': 'application/json'},
          body: loginData,
        )
        .timeout(const Duration(seconds: 2));

    //print('Login response: $response');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data['message'][0];
    } else {
      return Future.error(Exception('Failed to log in.'));
    }
  }
}
