import 'package:MyChat/FunctionWidgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'searched.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: appbarsss(context, 'ChatRoom Screen'),
      body: null,
      floatingActionButton: Container(
        height: 40,
        color: Colors.green.withOpacity(0.25),
        child: IconButton(
          icon: Icon(Icons.search, size: 24),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ));
          },
        ),
      ),
    );
  }
}
