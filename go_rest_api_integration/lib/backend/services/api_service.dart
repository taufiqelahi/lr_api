import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_rest_api_integration/backend/services/user_data_func.dart';
import 'package:go_rest_api_integration/pages/todo_screen.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "127.0.0.1:3000";

  registerUser(
      {required String email,
      required String password,
      required String username}) async {
    var url = Uri.http('127.0.0.1:3000', '/api/register');
    var response = await http.post(url,
        body: {'email': email, "password": password, "username": username});
  }

  loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var url = Uri.http(apiUrl, '/api/login');

    var response =
        await http.post(url, body: {'email': email, "pass": password});
    if (response.statusCode == 200) {
      await UserDataFunc().cacheUserToken(data: jsonDecode(response.body));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TodoScreen()),
          (route) => false);
    }else{
      print(response.body);
    }
    ;
  }
}
