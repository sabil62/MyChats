import 'package:flutter/material.dart';

class SinginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter email',
              hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              contentPadding: EdgeInsets.all(6),
              fillColor: Colors.green,
              focusColor: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
