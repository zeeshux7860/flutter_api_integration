import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/components/textfiled.dart';
import 'package:flutter_api_intigration/pages/register.dart';
import 'package:flutter_api_intigration/query/main/login.dart';

final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
class Login extends StatelessWidget {
 
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              textFiled(labelText: "Email",controller: email),
              const SizedBox(
                height: 10,
              ),
              textFiled(labelText: "Password", obscureText: true,controller: password),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    login(context, ParamsLogin(email: email.text, password: password.text));
                    
                  }
                }, child: const Text("Login")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Register();
                      }));
                    },
                    child: const Text("Register")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
