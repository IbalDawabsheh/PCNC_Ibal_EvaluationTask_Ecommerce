// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_status/http_status.dart';

class ApiService extends GetxController {
  final String uri = dotenv.get("URI");

  Future<dynamic> getRequest(String path,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(uri + path), headers: headers);

      if (response.statusCode.isSuccessfulHttpStatusCode) {
        return response;
      } else {
        log("Get Request Failed");
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> postRequest(String path, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      final response =
          await http.post(Uri.parse(uri + path), headers: headers, body: body);

      if (response.statusCode.isSuccessfulHttpStatusCode) {
        return response;
      } else {
        log("Post Request Failed");
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
