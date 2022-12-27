import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/login_page.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLoginScreen(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset('images/logo_new.png'),
      ),
    );
  }

  void navigateToLoginScreen(BuildContext buildContext){
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()),);
    });
  }
}
