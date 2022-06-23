import 'dart:convert';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';

import 'package:http/http.dart' as http;

class StatsService {
  static const String BASE = "/flutter/stats";

  static Future<ApiResponse> getAverageSpectators() async {
    if (ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
      Uri.parse(ApiServices.API_URL + BASE + "/directs/spectators/average"),
      headers: <String, String>{'authorization': "Bearer $token"},
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

    return apiResponse;
  }
}
