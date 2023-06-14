import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:phms_project_mobile/services/login/login.dart';

import '../config/api_end_points.dart';

enum HttpMethod { GET, POST, PUT }

Future<Response<dynamic>> fetchWithAuth(
    String endpointUrl, dynamic data, HttpMethod httpMethod) async {
  String? token = await getAccessToken();

  if (await token != null) {
    String baseUrl = ApiEndPoints().baseUrl;
    String url = baseUrl + endpointUrl;
    Dio dio = new Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response;

      if (httpMethod == HttpMethod.GET) {
        response = await dio.get(url);
        log(response.toString());
      } else if (httpMethod == HttpMethod.POST) {
        response = await dio.post(url, data: data);
      } else if (httpMethod == HttpMethod.PUT) {
        response = await dio.put(url, data: data);
      } else {
        throw Exception('Invalid HTTP method');
      }
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        Future<String?> refreshToken = getRefreshToken();
        String refreshTokenUrl = '$baseUrl/refresh-token';
        Dio refreshDio = new Dio();
        refreshDio.options.headers['Content-Type'] = 'application/json';
        Map<String, dynamic> data = {'refresh_token': refreshToken};
        Response response = await refreshDio.post(refreshTokenUrl, data: data);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = jsonDecode(response.data);
          String newAccessToken = responseData['access_token'];
          String newRefreshToken = responseData['refresh_token'];
          setAcccessToken(newAccessToken);
          setRefreshToken(newRefreshToken);
          dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
          // Retry the original request
          Response retryResponse;
          if (httpMethod == HttpMethod.GET) {
            retryResponse = await dio.get(url);
          } else if (httpMethod == HttpMethod.POST) {
            retryResponse = await dio.post(url, data: data);
          } else if (httpMethod == HttpMethod.PUT) {
            retryResponse = await dio.put(url, data: data);
          } else {
            throw Exception('invalid Http method ');
          }
          return retryResponse;
        } else {
          // Handle the case where the refresh request fails
          throw Exception('Failed to refresh token');
        }
      } else {
        // Handle the case where there is no refresh token
        throw Exception('No refresh token found');
      }
    }
  } else {
    // Handle the case where there is no access token
    throw Exception('No access token found');
  }
}
