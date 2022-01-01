import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/global.dart';
import 'package:http/http.dart' as http;



Future<ResponseRegister?> register(BuildContext context, ParamsRegister params) async {
  try {
    var res = await globalHandler.requestPost(
        "/public/register", jsonEncode(params.toJson()));
    var js = json.decode(res.body);
    var ds = ResponseRegister.fromJson(js);
    return ds;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}


class ParamsRegister {
  ParamsRegister({
    required this.name,
    required this.age,
    required this.email,
    required this.password,
  });
  late final String name;
  late final String age;
  late final String email;
  late final String password;

  ParamsRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['age'] = age;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}

class ResponseRegister {
  ResponseRegister({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  ResponseRegister.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
