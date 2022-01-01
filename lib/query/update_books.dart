import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/global.dart';

Future<ResponseUpdateBook?> updateBook(BuildContext context, ParamsUpdateBooks params) async {
  try {
    var res = await globalHandler.requestPatch(
        "/private/books/update", jsonEncode(params.toJson()));
    var js = json.decode(res.body);
    var ds = ResponseUpdateBook.fromJson(js);
    return ds;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

class ParamsUpdateBooks {
  ParamsUpdateBooks({
    required this.name,

    required this.page,
    required this.author,
    required this.id,
  });
  late final String name;
  late final String page;
  late final String author;
  late final String id;

  ParamsUpdateBooks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  
    page = json['page'];
    author = json['author'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
   
    _data['page'] = page;
    _data['author'] = author;
    _data['id'] = id;
    return _data;
  }
}

class ResponseUpdateBook {
  ResponseUpdateBook({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  ResponseUpdateBook.fromJson(Map<String, dynamic> json) {
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
