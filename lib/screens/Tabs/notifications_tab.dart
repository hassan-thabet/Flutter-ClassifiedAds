import 'package:flutter/material.dart';
class NotificationsTab extends StatefulWidget {
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Container(child: Center(child: Text('Notifications Content'),),),
    );
  }
}
