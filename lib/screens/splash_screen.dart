import 'dart:async';
import 'package:flutter/material.dart';
import 'package:classified_ads/ui/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = prefs.get(key ) ?? null;

    if(value != null) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }else{
      Navigator.of(context).pushNamedAndRemoveUntil('/onboarding', (route) => false);
    }
  }
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => read()
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      body: Container(
          color: KBackgroundColor,
          child: Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(KMainColor),
                  strokeWidth: 1.5,
                ),
              )
          ),
        ),
    );
  }


// @override
// initState(){
//   read();
// }


}