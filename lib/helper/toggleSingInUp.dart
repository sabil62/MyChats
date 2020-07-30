import 'package:MyChat/views/singin.dart';
import 'package:MyChat/views/singup.dart';
import 'package:flutter/material.dart';

class AuthAndToogleSingInUp extends StatefulWidget {
  @override
  _AuthAndToogleSingInUpState createState() => _AuthAndToogleSingInUpState();
}

class _AuthAndToogleSingInUpState extends State<AuthAndToogleSingInUp> {
  bool isSingIn = true;
  void toogle() {
    setState(() {
      isSingIn = !isSingIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSingIn) {
      return SinginPage(toogle);
    } else {
      return SingUpPage(toogle);
    }
  }
}
