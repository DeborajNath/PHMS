import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/config/api_end_points.dart';
import '../../modules/common_widget/bottom_nav_main.dart';

class AuthService {
  String baseUrl = ApiEndPoints().baseUrl;

  Future<String> login(context, String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    log('reached loginservice');
    var request = http.Request('POST', Uri.parse('$baseUrl/auth/login'));
    request.body = json.encode({
      "username": "$username",
      "password": "$password",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var loginSuccess = await response.stream.bytesToString();
      log('status 200');
      var loginSuccessMsg = jsonDecode(loginSuccess)['message'];
      var loginSuccessToken = jsonDecode(loginSuccess)['data']['access_token'];
      var refreshToken = jsonDecode(loginSuccess)['data']['refresh_token'];
      log(loginSuccess);
      setAcccessToken(loginSuccessToken);
      setRefreshToken(refreshToken);
      // Saving to shared preference
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavMainScreen(screenIndex: 0,)),
      );

      Fluttertoast.showToast(
          msg: loginSuccessMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 18.0);

      return loginSuccessToken;
    } else {
      var loginFailed = await response.stream.bytesToString();

      var loginFailedMsg = jsonDecode(loginFailed)['message'];

      print(loginFailed);
      Fluttertoast.showToast(
          msg: loginFailedMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);

      return loginFailedMsg;
    }
  }
}

Future<void> setAcccessToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('access_token', token);
}

Future<String?> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();

  // log(prefs.getString('access_token').toString());
  return prefs.getString('access_token');
}

Future<void> setRefreshToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('refresh_token', token);
}

Future<String?> getRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('refresh_token');
}

Future<void> deleteToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('access_token');
  await prefs.remove('refresh_token');
}
