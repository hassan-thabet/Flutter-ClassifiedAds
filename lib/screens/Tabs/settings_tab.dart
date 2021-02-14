
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  _save(String api_token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = api_token;
    prefs.setString(key, value);
  }


  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        backgroundColor: Color(0xFFf0f0f0),
        elevation: 0.0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16),
          child: Text('Settings',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.black87.withAlpha(200),
              )),
        ),

      ),
      body: Container(
        color: Color(0xFFf0f0f0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      // _save(null);
                      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    tileColor: Colors.white,
                    title: Text('Account'),
                    leading: Icon(Icons.person_outline_rounded, color: Colors.black87,),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      // _save(null);
                      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    tileColor: Colors.white,
                    title: Text('Privacy & Security'),
                    leading: Icon(Icons.lock_outline_sharp, color: Colors.black87,),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      // _save(null);
                      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    tileColor: Colors.white,
                    title: Text('Help and support'),
                    leading: Icon(Icons.headset, color: Colors.black87,),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      _save(null);
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    tileColor: Colors.white,
                    title: Text('Logout'),
                    leading: Icon(Icons.exit_to_app_outlined, color: Colors.black87,),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87,),
                  ),
                ),
              ],
            ),
          ),
        )
      ),

    );
  }
}
