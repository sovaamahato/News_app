import 'package:flutter/material.dart';
import 'package:news_app/home_page.dart';

class SplashScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
        return HomePage();
      }));
      
    });
    return Scaffold(
      body: Center(
        child: Column(children: [
          Image.asset("assets/icon/news.png"),
          const SizedBox(height: 20,),
          CircularProgressIndicator(),
        ]),
      ),
    );
  }
}