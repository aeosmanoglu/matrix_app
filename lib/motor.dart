import 'dart:convert';
import 'package:http/http.dart';
import 'package:matrixapp/login_obj.dart';
import 'package:matrixapp/user_search_obj.dart';

class Motor {
  String server = "http://localhost:8008";

  login(String user, String password) async {
    String url = server + "/_matrix/client/r0/login";
    Map<String, String> headers = {"content-type": "application/json"};
    String type = "m.login.password";
    Map<String, String> identifier = {"type": "m.id.user", "user": user};
    String body = jsonEncode({"type": type, "identifier": identifier, "password": password});
    Response response = await post(url, headers: headers, body: body);
    LoginObj obj = LoginObj.fromJson(jsonDecode(response.body));
    return obj;
  }

  logout(String accessToken) async {
    String url = server + "/_matrix/client/r0/logout";
    Map<String, String> headers = {"authorization": "Bearer $accessToken"};
    Response response = await post(url, headers: headers);
    print(response.statusCode);
  }

  logoutAll(String accessToken) async {
    String url = server + "/_matrix/client/r0/logout/all";
    Map<String, String> headers = {"Authorization": "Bearer $accessToken"};
    await post(url, headers: headers);
  }

  userSearch(String accessToken, String searchTerm) async {
    String url = server + "/_matrix/client/r0/user_directory/search";
    Map<String, String> headers = {"content-type": "application/json", "authorization": "Bearer $accessToken"};
    String body = jsonEncode({"search_term": searchTerm});
    Response response = await post(url, headers: headers, body: body);
    UserSearchObj obj = UserSearchObj.fromJson(jsonDecode(response.body));
    return obj.results;
  }
}
