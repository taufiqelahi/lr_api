import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_rest_api_integration/backend/services/api_service.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Enter your Name'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Enter Email '),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          CupertinoButton(
            child: const Text('Sign up'),
            onPressed: () async {
              await ApiService().registerUser(
                  email: emailController.text,
                  password: passController.text,
                  username: nameController.text);
            },
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
