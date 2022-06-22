import 'dart:convert';

import 'package:dvot_dashboard_init/services/api-services.dart';

import '../../class/api-response.dart';
import 'package:http/http.dart' as http;

class DirectsService {
  static const String BASE = "/flutter/direct";

  static Future<ApiResponse> countDirects() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + BASE + "/count"),
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

  static Future<ApiResponse> getLatestLive() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + BASE + "/latest/live"),
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

  static Future<ApiResponse> getAll() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + BASE + "/list"),
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

  static Future<ApiResponse> getSpectatorsById(String id) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + BASE + "/spectators/$id"),
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

  static Future<ApiResponse> updateLive(String id, bool live) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.put(
        Uri.parse(ApiServices.API_URL + BASE + "/live/$id/$live"),
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