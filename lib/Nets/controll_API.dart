import 'dart:convert';
import 'package:etec_api/Models/users_class.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<User> getUser() async {
    var client = http.Client();
    var userModel;
    final url = 'https://reqres.in/api/users?page=2';
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        userModel = User.fromJson(jsonMap);
      }
    } catch (Exception) {
      print('Error : $Exception');
    }
    return userModel;
  }
}