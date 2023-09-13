import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_rest_api_integration/backend/services/user_data_func.dart';
import 'package:go_rest_api_integration/pages/login_page.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: UserDataFunc().getLoggedInUserData,
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>?> snapshot) {

                if(snapshot.connectionState==ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                return Text(snapshot.data!.toString());
              },
            ),
            CupertinoButton(child: Text("Logout"), onPressed: () async{
              await UserDataFunc().logout();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);

            })
          ],
        ),
      ),
    );
  }
}
