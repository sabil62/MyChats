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
            decoration: buildInputDecoration('Enter email'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: buildInputDecoration('Enter password'),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              child: Text(
                'Forget Password',
                style: buildTextStyle(18),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: buildBoxDecoration(Colors.blue),
            child: Text(
              'Sign in',
              style: buildTextStyle(18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: buildBoxDecoration(Colors.blue[100]),
            child: Text(
              'Sign in with Google',
              style: buildTextStyle(18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Don\'t have a account?',
                style: buildTextStyle(16),
              ),
              Text(
                'Register now',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              )
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration(Color colorr) {
    return BoxDecoration(
        color: colorr,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(offset: Offset(2, 2), blurRadius: 10, color: Colors.black45)
        ]);
  }

  TextStyle buildTextStyle(double size) => TextStyle(
      color: Colors.white, fontSize: size, fontWeight: FontWeight.bold);

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.blue[200])),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      contentPadding: EdgeInsets.all(6),
      fillColor: Colors.green,
      focusColor: Colors.yellow,
    );
  }
}
