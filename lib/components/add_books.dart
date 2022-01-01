import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/callback/book_callback.dart';
import 'package:flutter_api_intigration/components/textfiled.dart';

class AddBooks extends StatelessWidget {
  
  const AddBooks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Center(child: Text("Add Book")),
        const  Divider(),
          Expanded(child: ListView(children: [
             textFiled(labelText: 'Name',controller: BookCallback(context).nameController),
         const SizedBox(
            height: 10,
          ),
          textFiled(labelText: 'Author',controller: BookCallback(context).authorController),
       const    SizedBox(
            height: 10,
          ),
          textFiled(labelText: 'Page',controller: BookCallback(context).pageController),
         const  SizedBox(
            height: 10,
          ),
          TextButton(onPressed: (){
          
            BookCallback(context).addBook();
          }, child: const Text("Submit"))
        
          ],))
         ],
      ),
    );
  }
}