import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import '../../core/utils/web_client.dart';
import '../../models/doctor_card_details_model.dart';

class DoctorCardRepository {
  String userUrl = '/api/hospital/6435480738070b4ad671ce1c/staff';

  Future<List<DoctorCardDetailsModel>> getCardDetails() async {
    Response response = await fetchWithAuth(userUrl, null, HttpMethod.GET);
    log(response.toString());
    if (response.data != null) {
      log('Response data: ${response.data['data']}');
      // List<Map<String, dynamic>> result = jsonDecode(response.data)['data'];
      // log(result.toString());
      return (response.data['data'] as List<dynamic>)
          .map((e) => DoctorCardDetailsModel.fromJson(e))
          .toList();
      // var userData = response.data['data'];
      // DoctorCardDetailsModel model = DoctorCardDetailsModel.fromJson(userData);
      // log(model.name.toString());
      // log(response.data());c
    } else {
      log('error msg');
      throw Exception(response.statusCode);
    }
  }
}
