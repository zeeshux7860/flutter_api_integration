import 'package:flutter/material.dart';

Widget textFiled(
    {String? labelText, TextEditingController? controller, bool? obscureText, TextInputType? keyboardType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          labelText!,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
      TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
         validator: (value) {
           if (value == null  || value.isEmpty) {
             return 'Please enter ' +labelText;
           }
         },
        decoration: InputDecoration(
          
          labelText: labelText,
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    ],
  );
}
