import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import '../../core/utils/web_client.dart';
import '../../models/user_details_model.dart';

class UserRepository {
  String userUrl = '/users/asterstaff@testmail.com';

  Future<UserDetailsModel> getUsers() async {
    Response response = await fetchWithAuth(userUrl, null, HttpMethod.GET);
    log(response.toString());
    if (response.data != null) {
      log('Response data: ${response.data}');
      var userData = response.data['data'];
      UserDetailsModel model = UserDetailsModel.fromJson(userData);
      log(model.firstName.toString());
      return model;
    } else {
      log('error msg');
      throw Exception(response.statusCode);
    }
  }
}
