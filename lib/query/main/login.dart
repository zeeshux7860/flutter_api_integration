

 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/pages/home.dart';
import 'package:flutter_api_intigration/query/global.dart';

login(BuildContext context, ParamsLogin params) async {
try {
  
var res = await globalHandler.requestPost("/public/login", jsonEncode(params.toJson()));

var js = json.decode(res.body);
ResponseLogin responseLogin = ResponseLogin.fromJson(js);
if (responseLogin.status == 200) {   
globalHandler.setToken(responseLogin.authToken!);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return const HomePage();
  }));
} else {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(js['message'])));
}
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
}
}

class ParamsLogin {
  ParamsLogin({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;
  
  ParamsLogin.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}


class ResponseLogin {
  ResponseLogin({
    required this.status,
    required this.authToken,
  });
  late final int status;
  late final String? authToken;
  
  ResponseLogin.fromJson(Map<String, dynamic> json){
    status = json['status'];
    authToken = json['auth-token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['auth-token'] = authToken;
    return _data;
  }
}



// Get Post Put patch Delete

// {
//     "name" : "zee",
//     "age" : "10",
//    "email" : "test@gmail.com",
//    "password" : "123",
//    "page" : "10",
//    "author" : "zees",
//    "id" : "61ce3c8b7e24916f31c37952"
// }