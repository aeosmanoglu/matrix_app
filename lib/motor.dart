import 'dart:convert';
import 'package:http/http.dart';
import 'package:matrixapp/login_obj.dart';

class Motor {
  String server = "http://localhost:8008";
  Map<String, String> header = {"content-type": "application/json"};

  login(String user, String password) async {
    String url = server + "/_matrix/client/r0/login";
    String type = "m.login.password";
    Map<String, String> identifier = {"type": "m.id.user", "user": user};
    String body = jsonEncode({"type": type, "identifier": identifier, "password": password});
    Response response = await post(url, headers: header, body: body);
    var obj = LoginObj.fromJson(jsonDecode(response.body));
    return obj;
  }
}
