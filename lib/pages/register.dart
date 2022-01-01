import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/components/textfiled.dart';
import 'package:flutter_api_intigration/query/main/register.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController age = TextEditingController();
final _formKey = GlobalKey<FormState>();

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            textFiled(labelText: "Name", controller: name),
            const SizedBox(
              height: 10,
            ),
            textFiled(
                labelText: "Age",
                controller: age,
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 10,
            ),
            textFiled(labelText: "Email", controller: email),
            const SizedBox(
              height: 10,
            ),
            textFiled(
                labelText: "Password", obscureText: true, controller: password),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var ds = await register(
                          context,
                          ParamsRegister(
                              name: name.text,
                              age: age.text,
                              email: email.text,
                              password: password.text));
                      if (ds!.status == 200) {
                        name.clear();
                        email.clear();
                        age.clear();
                        password.clear();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(ds.message)));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(ds.message)));
                      }
                    }
                  },
                  child: const Text("Register Now")),
            ),
          ],
        ),
      ),
    );
  }
}
