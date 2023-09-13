
import 'package:flutter/material.dart';
import 'package:go_rest_api_integration/backend/services/user_data_func.dart';
import 'package:go_rest_api_integration/pages/login_page.dart';
import 'package:go_rest_api_integration/pages/todo_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text("Loading"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gotoTodoNextScreen();
  }

  void gotoTodoNextScreen() async{
    Map<String, dynamic>? userData= await UserDataFunc().getLoggedInUserData;
    print(userData);

    if(userData==null){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>TodoScreen()), (route) => false);

    }
  }
}
