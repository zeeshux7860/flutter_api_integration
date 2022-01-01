import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/global.dart';


Future<ResponseDeleteBook?> deleteBook(BuildContext context, ParamsDeleteBook params) async {
  try {
    var res = await globalHandler.requestDelete(
        "/private/books/delete", jsonEncode(params.toJson()));
    var js = json.decode(res.body);
    var ds = ResponseDeleteBook.fromJson(js);
  
   return ds;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

class ParamsDeleteBook {
  ParamsDeleteBook({
    required this.id,
  });
  late final String id;


  ParamsDeleteBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}

class ResponseDeleteBook {
  ResponseDeleteBook({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  ResponseDeleteBook.fromJson(Map<String, dynamic> json) {
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
