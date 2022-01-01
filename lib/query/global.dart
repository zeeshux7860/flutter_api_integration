import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/pages/login.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GlobalHandler {
  setToken(String tokenValue) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("token", tokenValue);
    _pref.setBool("is_Logedin", true);
  }

  Future<String> getToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    return token ?? '';
  }

  logout(BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return  const Login();
    }));
  }

  Future<bool> checkLoggedin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var isLoggedin = _pref.getBool("is_Logedin");
    return isLoggedin ?? false;
  }

  Future<Map<String, String>?> getHeaders() async {
    var token = await getToken();

    return {
     'Content-Type': 'application/json',
      "auth-token": token
    };
  }

  var baseUrl = "http://localhost:3000";

  Future<Response> requestPost(String path, Object body) async {
    var header = await getHeaders();

    var ds = await http.post(Uri.parse(baseUrl + path),
        headers: header, body: body);
    return ds;
  }

  Future<Response> requestPatch(String path, Object? body) async {
    var header = await getHeaders();
    return await http.patch(Uri.parse(baseUrl + path),
        headers: header, body: body);
  }

  Future<Response> requestPut(String path, Object? body) async {
    var header = await getHeaders();
    return await http.put(Uri.parse(baseUrl + path),
        headers: header, body: body);
  }

  Future<Response> requestGet(String path) async {
    var header = await getHeaders();
    return await http.get(Uri.parse(baseUrl + path), headers: header);
  }

  Future<Response> requestDelete(String path, Object? body) async {
    var header = await getHeaders();
    return await http.delete(Uri.parse(baseUrl + path),  headers: header, body: body);
  }
  back(BuildContext context){
    Navigator.pop(context);
  }
}

var globalHandler = GlobalHandler();
