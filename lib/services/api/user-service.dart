import 'dart:convert';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/user.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';

import 'package:http/http.dart' as http;

class UserService {
  static const String BASE = "/flutter/utilisateur";

  static Future<ApiResponse> countActiveUsers() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + BASE + "/count/active"),
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

  static Future<ApiResponse> getAllUsers() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + BASE + "/liste"),
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

  static Future<ApiResponse> deleteUser(User user) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.delete(
        Uri.parse(ApiServices.API_URL + BASE + "/suppression"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': "Bearer $token"
        },
        body: jsonEncode({"mail": user.mail}),
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Suppression Impossible, veuillez réessayer plus tard", data: []);
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }

  static Future<ApiResponse> countAllUsers() async {
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

  static Future<ApiResponse> add(User user) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.put(
      Uri.parse(ApiServices.API_URL + BASE + "/ajout"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
      body: jsonEncode(user.toJson()),
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Ajout Impossible, veuillez réessayer plus tard", data: []);
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }

  static Future<ApiResponse> update(User user, String mail) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.put(
      Uri.parse(ApiServices.API_URL + BASE + "/update/$mail"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
      body: jsonEncode(user.toJsonWhithtouPassword()),
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Modification Impossible, veuillez réessayer plus tard", data: []);
    }

    if(mail == ApiServices.session["mail"]){
      ApiServices.session["mail"] = user.mail;
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }
}