import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/query/global.dart';

AppBar appBarCustom(BuildContext context){
  return AppBar(
          title: const Text("Rest API Tutorial"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Are you want to sure logout?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  globalHandler.logout(context);
                                },
                                child: const Text("Logout")),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.close))
          ],
        );
}