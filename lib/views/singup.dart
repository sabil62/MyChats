import 'package:MyChat/FunctionWidgets/Widgets.dart';
import 'package:MyChat/helper/sharedpreferences.dart';
import 'package:MyChat/services/database.dart';
import 'package:MyChat/views/chatRoomScreen.dart';
import 'package:flutter/material.dart';
import '../services/firebase.dart';

class SingUpPage extends StatefulWidget {
  final Function toogle;
  SingUpPage(this.toogle);
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  //classes
  AuthMethods auth = AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  SharedPreferencess sharedPreferencess = new SharedPreferencess();

  bool istrue = false;

  void goForSingUp() {
    if (formkey.currentState.validate()) {
      setState(() {
        istrue = true;
      });
      //for database updating
      Map<String, String> userAndEmail = {
        "username": usernameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      //this is using sharedpreferences as session
      sharedPreferencess
          .setSharedPreferenceUsername(usernameTextEditingController.text);
      sharedPreferencess
          .setSharedPreferenceEmail(emailTextEditingController.text);

      //for AUTHENTICATION
      auth.singUpWithFirebasess(
          emailTextEditingController.text, passwordTextEditingController.text);
      //add to DATABASE
      databaseMethods.updateUserName(userAndEmail);
      //using SHAREDPREFERNCES as sessions
      sharedPreferencess.setSharedPreferenceLogin(true);

      //to navigate to new page
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => ChatRoomScreen()));
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
                                return value == null || value.length < 6
                                    ? 'Please enter valid password and longer than  6'
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
                        onTap: goForSingUp, //or (){goForSignUp()}
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: buildBoxDecoration(Colors.blue),
                          child: Text(
                            'Sign Up',
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
                            'Already have a account?',
                            style: buildTextStyle(16),
                          ),
                          GestureDetector(
                            onTap: widget.toogle, //or (){widget.toogle();}
                            child: Text(
                              'SingIn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
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
