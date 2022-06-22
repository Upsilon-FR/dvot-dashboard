import 'dart:convert';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<ApiResponse> login(String mail, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiServices.API_URL + "/auth/connect"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(
            {"mail": mail, "mot_de_passe": password, "role": "ADMIN"}),
      );
      print(response.body);
      if (response.statusCode != 200) {
        return ApiResponse(
            error: true,
            message: "Connexion Impossible, veuillez réessayer plus tard",
            data: []);
      }

      final body = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(body);
      ApiServices.session["token"] = apiResponse.data[0]["token"];
      ApiServices.session["mail"] = mail;

      return apiResponse;
    } catch (e) {
      return ApiResponse(
          error: true,
          message: "Connexion Impossible, veuillez réessayer plus tard",
          data: []);
    }
  }

  static Future<ApiResponse> logout(String mail) async {
    try {
      if (ApiServices.session["token"] == null) {
        throw Error();
      }
      String? token = ApiServices.session["token"];
      final response = await http.post(
        Uri.parse(ApiServices.API_URL + "/auth/disconnect"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': "Bearer $token"
        },
        body: jsonEncode({"mail": mail, "role": "ADMIN"}),
      );
      print(response.body);
      if (response.statusCode != 200) {
        return ApiResponse(
            error: true,
            message: "Déconnexion Impossible, veuillez réessayer plus tard",
            data: []);
      }

      final body = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(body);
      ApiServices.session.remove("token");
      ApiServices.session.remove("mail");

      return apiResponse;
    } catch (e) {
      return ApiResponse(
        error: true,
        message: "Connexion Impossible, veuillez réessayer plus tard",
        data: [],
      );
    }
  }
}
