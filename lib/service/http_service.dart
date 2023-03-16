
import 'dart:convert';

import 'package:http/http.dart';
import 'package:users_pattern_bloc/model/user_model.dart';

import 'log_service.dart';

class Network{
  static String BASE = "6412e88b3b71064737593418.mockapi.io";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_USER_LIST = "/post/user";
  static String API_DELETE = "/post/user/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    LogService.i(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  /* Http Parsing */

  static List<User> parseUserList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<User>.from(json.map((x) => User.fromJson(x)));
    return data;
  }

}