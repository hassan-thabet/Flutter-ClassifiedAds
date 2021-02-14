import 'package:flutter/material.dart';

class MessagesTab extends StatefulWidget {
  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        backgroundColor: Color(0xFFf0f0f0),
        elevation: 0.0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16),
          child: Text('Messages',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.black87.withAlpha(200),
              )),
        ),

      ),
      body: Container(
        child: Center(child: Text('Messages Content'),),

      ),
    );
  }
}
