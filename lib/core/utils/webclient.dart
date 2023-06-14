import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebClient {
  static const baseurl = 'http://192.168.29.3:8083';
  static Future<dynamic> post(url, data) async {
    Map sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    debugPrint(sendData.toString());
    http.Response response;
    var body = json.encode(sendData);
    try {
      response = await http.post(
        Uri.parse(baseurl + url),
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      var error = {
        "status": false,
        "message":
            "Something went wrong , Check your internet connection and try again"
      };
      return error;
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "message": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    try {
      var response = await http.get(
        Uri.parse(baseurl + url),
        headers: {
          //"Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        var error = {
          "status": false,
          "message": "Invalid Request",
        };
        return error;
      }
    } on Exception catch (_) {}
  }
}
