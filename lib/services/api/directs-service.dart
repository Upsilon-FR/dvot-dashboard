import 'dart:convert';

import 'package:dvot_dashboard_init/services/api-services.dart';

import '../../class/api-response.dart';
import 'package:http/http.dart' as http;

class DirectsService {
  static Future<ApiResponse> countDirects() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + "/flutter/direct/count"),
        headers: <String, String>{
          'authorization' : "Bearer $token"
        }
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Opération Impossible, veuillez réessayer plus tard", data: []);
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }
}