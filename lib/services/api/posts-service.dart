import 'dart:convert';

import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';

import '../../class/api-response.dart';

import 'package:http/http.dart' as http;

class PostsService {
  static const String BASE = "/flutter/post";


  static Future<ApiResponse> countPosts() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + "/flutter/post/count"),
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

  static Future<ApiResponse> countPassedPosts() async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse(ApiServices.API_URL + "/flutter/post/count/passed"),
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

  static Future<ApiResponse> getAllPosts(int limit) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.get(
        Uri.parse( "${ApiServices.API_URL}/flutter/post/list/$limit"),
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

  static Future<ApiResponse> deletePost(Post post) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.delete(
      Uri.parse(ApiServices.API_URL + BASE + "/delete/${post.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Suppression Impossible, veuillez réessayer plus tard", data: []);
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }

  static Future<ApiResponse> add(Post post) async {
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
      body: jsonEncode(post.toJson())
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Ajout Impossible, veuillez réessayer plus tard", data: []);
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }

  static Future<ApiResponse> update(Map<String, dynamic> updatedPost, String id) async {
    if(ApiServices.session["token"] == null) {
      throw Error();
    }
    String? token = ApiServices.session["token"];
    final response = await http.put(
      Uri.parse(ApiServices.API_URL + BASE + "/update/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
      body: jsonEncode(updatedPost)
    );
    print(response.body);
    if(response.statusCode != 200){
      return ApiResponse(error: true, message: "Modification Impossible, veuillez réessayer plus tard", data: []);
    }

    final body = json.decode(response.body);
    return ApiResponse.fromJson(body);
  }
}