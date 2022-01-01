import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/provider/books.dart';

import 'package:provider/provider.dart';

class BookCallback {
  final BuildContext context;

  BookCallback(this.context);
  addBook() async {
    await Provider.of<BookProvider>(context,listen: false).addBookProvider(context);
    getBook();
  }

   updateBook(String id) async {
    await Provider.of<BookProvider>(context,listen: false).updateBookProvider(context,id);
    getBook();
  }
  getBook() async {
   await  Provider.of<BookProvider>(context,listen: false).getBookProvider(context);

  }
   
  delete(String id) async {
   await  Provider.of<BookProvider>(context,listen: false).deleteBookProvider(context, id);
getBook();
  }

  clearController() async {
     await Provider.of<BookProvider>(context,listen: false).clearControllerProvider();

  }
 TextEditingController  get nameController => Provider.of<BookProvider>(context,listen: false).name;
  TextEditingController get pageController => Provider.of<BookProvider>(context,listen: false).page;
TextEditingController   get authorController => Provider.of<BookProvider>(context, listen: false).author;
  
}
