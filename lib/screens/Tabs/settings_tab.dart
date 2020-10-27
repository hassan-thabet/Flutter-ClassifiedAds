
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListTile(
          onTap: (){
            _save(null);
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
          },
          title: Text('Logout'),
          leading: Icon(Icons.category, color: Colors.black87,),
        )
      ),

    );
  }
}
