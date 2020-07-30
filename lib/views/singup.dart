import 'package:MyChat/FunctionWidgets/Widgets.dart';
import 'package:flutter/material.dart';
import '../services/firebase.dart';

class SingUpPage extends StatefulWidget {
  //this is from another class
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  AuthMethods auth = AuthMethods();

  bool istrue = false;

  void goForSingUp() {
    if (formkey.currentState.validate()) {
      setState(() {
        istrue = true;
      });
      auth.singUpWithFirebasess(
          emailTextEditingController.text, passwordTextEditingController.text);
      //to navigate to new page

    }
  }

  final formkey = GlobalKey<FormState>();

  TextEditingController usernameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarsss(context, 'Sing Up'),
      backgroundColor: Colors.black54,
      body: istrue
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'Please Enter username';
                                } else if (value.length < 4) {
                                  return 'Please Enter more than 4 characters';
                                }
                              },
                              controller: usernameTextEditingController,
                              decoration: buildInputDecoration('username'),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value =
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)
                                        ? 'Please enter valid email'
                                        : null;
                              },
                              controller: emailTextEditingController,
                              decoration: buildInputDecoration('Enter email'),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value == null
                                    ? 'Please enter valid password'
                                    : null;
                              },
                              obscureText: true, //for password
                              controller: passwordTextEditingController,
                              decoration:
                                  buildInputDecoration('Enter new password'),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Text(
                            'Forget Password',
                            style: buildTextStyle(16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: goForSingUp, //or (){goForSignUp}
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: buildBoxDecoration(Colors.blue),
                          child: Text(
                            'Sign in',
                            style: buildTextStyle(18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 70,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.85,
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
                ),
              ),
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
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue[400])),
      contentPadding: EdgeInsets.all(6),
    );
  }
}
