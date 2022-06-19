import 'dart:convert';
import 'package:dvot_dashboard_init/pages/class/api-response.dart';
import 'package:http/http.dart' as http;

import '../class/user.dart';

var JWT = "";

class ApiServices {
  static const API_URL = "http://localhost:3000";
  static Future<bool> login(String mail, String password) async{
    final response = await http.post(
      Uri.parse(API_URL + "/auth/connect"),
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode({"mail": mail, "mot_de_passe": password, "role": "ADMIN"}),
    );

    if(response.statusCode != 200) {
      return false;
    }
    print(response.body);

    final body = json.decode(response.body);
    final ApiResponse apiResponse = ApiResponse.fromJson(body);

    JWT = apiResponse.data[0]["token"];
    return true;
  }
}
