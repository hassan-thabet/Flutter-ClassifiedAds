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
        title: Text('Messages'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(height: 100, width: double.infinity,color: Colors.yellow,),
            Spacer(),
            Center(child: Text('Messages Content'),),
            Spacer(),
            Container(height: 100, width: double.infinity,color: Colors.red,),

          ],
        )
      ),
    );
  }
}
