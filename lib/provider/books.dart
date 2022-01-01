import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/add_books.dart';
import 'package:flutter_api_intigration/query/delete_books.dart';
import 'package:flutter_api_intigration/query/get_books.dart';
import 'package:flutter_api_intigration/query/global.dart';
import 'package:flutter_api_intigration/query/update_books.dart';

class BookProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController page = TextEditingController();

  ResponseBooks? bookList;

  Future addBookProvider(
    BuildContext context,
  ) async {
    var ds = await addBook(context,
        ParamsBooks(name: name.text, page: page.text, author: author.text));

    if (ds!.status == 200) {
      name.clear();
      author.clear();
      page.clear();
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ds.message.toString())));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ds.message.toString())));
    }
    //notifyListeners();
  }

  Future updateBookProvider(BuildContext context, String id) async {
    var ds = await updateBook(
        context,
        ParamsUpdateBooks(
          id: id,
          name: name.text,
          page: page.text,
          author: author.text,
        ));
    if (ds!.status != 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Session expire")));
      globalHandler.logout(context);
    } else {
      globalHandler.back(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ds.message.toString())));
    }

    //notifyListeners();
  }

  Future getBookProvider(BuildContext context) async {
    var ds = await getBook(context);
    bookList = ds;
    notifyListeners();
  }

  Future deleteBookProvider(BuildContext context, String id) async {
    var ds = await deleteBook(context, ParamsDeleteBook(id: id));
    globalHandler.back(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(ds!.message.toString())));
  }

  Future clearControllerProvider() async {
    name.text = '';

    notifyListeners();
  }
}
