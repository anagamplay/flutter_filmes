import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../utils/response.dart';

class LoginInput {
  String? login;
  String? senha;

  toMap() {
    return {
      "login": login,
      "senha": senha,
    };
  }
}

class LoginResponse {
  final bool status;
  final String msg;

  LoginResponse.fromJson(Map<String, dynamic> map)
      : status = map["status"] == "OK",
        msg = map["msg"];
}

class LoginApi {
  static Future<GenericResponse<LoginResponse>> login(LoginInput l) async {
    //await Future.delayed(Duration(milliseconds: 200));

    try {
      final url = Uri.parse("http://livrowebservices.com.br/rest/login");

      final params = {"login": l.login, "senha": l.senha};

      print("> Login POST: $url");
      print("> Params: $params");

      final response = await http.post(url, body: params);

      final json = response.body;
      final map = convert.json.decode(json);
      print("< json: $map");

      final r = LoginResponse.fromJson(map);

      return GenericResponse(true, msg: r.msg, result: r);
    } catch(error, stacktrace) {
      print("Login error: $error - $stacktrace");

      return GenericResponse(false, msg: "Não foi possível fazer o login");
    }
  }
}