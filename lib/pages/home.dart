import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/callback/book_callback.dart';
import 'package:flutter_api_intigration/components/add_books.dart';
import 'package:flutter_api_intigration/components/appbar.dart';
import 'package:flutter_api_intigration/components/update_book.dart';
import 'package:flutter_api_intigration/provider/books.dart';
import 'package:flutter_api_intigration/query/global.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BookCallback(context).getBook();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const AddBooks();
                  });
            }),
        appBar: appBarCustom(context),
        body: Consumer<BookProvider>(
          builder: (context, ds, child) {
            return ds.bookList == null
                ? const Center(child: CircularProgressIndicator())
                : ds.bookList!.resultBooks.length <= 0
                    ? const Center(
                        child: Text("No Books Found"),
                      )
                    : ListView.builder(
                        itemCount: ds.bookList!.resultBooks.length,
                        itemBuilder: (context, index) {
                          var data = ds.bookList!.resultBooks[index];
                          return ListTile(
                            onTap: () {
                              BookCallback(context).nameController.text =
                                  data.name;
                              BookCallback(context).authorController.text =
                                  data.author;
                              BookCallback(context).pageController.text =
                                  data.page.toString();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return  UpdateBooks(id: data.id,);
                                  }).whenComplete(() {
                                BookCallback(context).nameController.clear();
                                BookCallback(context).authorController.clear();
                                BookCallback(context).pageController.clear();
                              });
                            },
                            title: Text(data.name),
                            subtitle: Row(
                              children: [
                                Text(data.author),
                                Text(data.page.toString())
                              ],
                            ),
                            trailing: TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text("Are You want to delete?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  globalHandler.back(context);
                                                },
                                                child: Text("Cancel")),
                                            TextButton(
                                                onPressed: () {
                                                  BookCallback(context)
                                                      .delete(data.id);
                                                },
                                                child: Text("Delete"))
                                          ],
                                        );
                                      });
                                },
                                style:
                                    TextButton.styleFrom(primary: Colors.red),
                                child: const Text("Deelete")),
                          );
                        });
          },
        ));
  }
}
