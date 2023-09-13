import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_rest_api_integration/backend/services/api_service.dart';
import 'package:go_rest_api_integration/pages/todo_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Enter Email '),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          CupertinoButton(
            child: const Text('Login'),
            onPressed: () async {
              await ApiService().loginUser(
                  email: emailController.text, password: passController.text, context: context);

            },
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
