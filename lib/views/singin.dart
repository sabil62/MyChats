import 'package:MyChat/FunctionWidgets/Widgets.dart';
import 'package:MyChat/helper/sharedpreferences.dart';
import 'package:MyChat/services/database.dart';
import 'package:MyChat/services/firebase.dart';
import 'package:MyChat/views/chatRoomScreen.dart';
import 'package:MyChat/views/null.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatefulWidget {
  final Function toogle;
  SinginPage(this.toogle);
  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  bool isloading = false;
  //form key
  final formkey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  //now for class imports
  AuthMethods authMethods = AuthMethods();
  SharedPreferencess sharedPreferencess = SharedPreferencess();
  DatabaseMethods databaseMethods = DatabaseMethods();
//for data from firestore database
  QuerySnapshot querySnapshotss;

  void goSignIn() {
    setState(() {
      isloading = true;
    });
    if (formkey.currentState.validate()) {
      sharedPreferencess
          .setSharedPreferenceEmail(emailTextEditingController.text);
      //for username to be saved in session
      databaseMethods.getUserName(emailTextEditingController.text).then((val) {
        querySnapshotss = val;
      });
      sharedPreferencess.setSharedPreferenceUsername(
          querySnapshotss.documents[0].data['username']);
      //for authentication
      authMethods
          .signInWithFirebasess(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        if (value != null) {
          //sharedpreference
          sharedPreferencess.setSharedPreferenceLogin(true);
          //go to chatRoomPage
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) {
            return ChatRoomScreen();
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Nuller();
          }));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarsss(context, 'SingIn'),
      backgroundColor: Colors.black45,
      body: isloading
          ? Center(
              child: SingleChildScrollView(),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration('Enter email'),
                        controller: emailTextEditingController,
                        validator: (email) {
                          email !=
                                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(email) ||
                                  email == null
                              ? 'Please enter valid email'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration('Enter password'),
                        validator: (val) {
                          val == null ? 'Please enter valid password' : null;
                        },
                        obscureText: true,
                      ),
                    ],
                  ),
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
                GestureDetector(
                  onTap: () => goSignIn(),
                  child: Container(
                    height: 70,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: buildBoxDecoration(Colors.blue),
                    child: Text(
                      'Sign in',
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
                    //Here we use gesture detector to toogle between Singin and Signup
                    GestureDetector(
                      onTap: () {
                        widget.toogle();
                      },
                      child: Text(
                        'Register now',
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
