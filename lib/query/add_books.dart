import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/global.dart';

Future<ResponseAddBook?> addBook(BuildContext context, ParamsBooks params) async {
  try {
    var res = await globalHandler.requestPost(
        "/private/books/add", jsonEncode(params.toJson()));
    var js = json.decode(res.body);
    
    var ds = ResponseAddBook.fromJson(js);
    // if (res.statusCode != 200) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(ds.message.toString())));
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(ds.message.toString())));
    // }
    
    return ds;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
class ParamsBooks {
  ParamsBooks({
    required this.name,
    
    required this.page,
    required this.author,
  });
  late final String name;

  late final String page;
  late final String author;
  
  
  ParamsBooks.fromJson(Map<String, dynamic> json){
    name = json['name'];
   
    page = json['page'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    
    _data['page'] = page;
    _data['author'] = author;
 
    return _data;
  }
}
class ResponseAddBook {
  ResponseAddBook({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  ResponseAddBook.fromJson(Map<String, dynamic> json) {
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
