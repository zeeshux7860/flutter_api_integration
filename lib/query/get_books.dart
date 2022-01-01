import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/global.dart';

Future<ResponseBooks?> getBook(BuildContext context) async {
  try {
    var res = await globalHandler.requestGet("/public/books/show");
    var js = json.decode(res.body);
    var ds = ResponseBooks.fromJson(js);
    return ds;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

class ResponseBooks {
  ResponseBooks({
    required this.status,
    required this.resultBooks,
  });
  late final int status;
  late final List<ResultBooks> resultBooks;

  ResponseBooks.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultBooks = List.from(json['result_books'])
        .map((e) => ResultBooks.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['result_books'] = resultBooks.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ResultBooks {
  ResultBooks({
    required this.id,
    required this.createUserId,
    required this.name,
    required this.page,
    required this.author,
    required this.date,
    required this.status,
    required this.V,
  });
  late final String id;
  late final String createUserId;
  late final String name;
  late final int page;
  late final String author;
  late final String date;
  late final int status;
  late final int V;

  ResultBooks.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    createUserId = json['create_user_id'];
    name = json['name'];
    page = json['page'];
    author = json['author'];
    date = json['date'];
    status = json['status'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['create_user_id'] = createUserId;
    _data['name'] = name;
    _data['page'] = page;
    _data['author'] = author;
    _data['date'] = date;
    _data['status'] = status;
    _data['__v'] = V;
    return _data;
  }
}
