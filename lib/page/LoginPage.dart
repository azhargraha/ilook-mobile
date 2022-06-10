import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilook/main.dart';
import 'package:ilook/page/Home.dart';
import 'package:ilook/page/RegisterPage.dart';
import 'package:ilook/services/authServices.dart';
import 'package:http/http.dart' as http;
import 'package:ilook/services/globals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';

  loginPressed() async {
    if (_username.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_username, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const PageNavigator(),
            ));
      } else {
        errorSnackBar(context, responseMap['message']);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: screen.width,
          height: screen.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: screen.width * 0.8,
                      child: SvgPicture.asset('assets/logo.svg'),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Welcome to iLook',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 35),
                      child: Text(
                        'Sign in to continue',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextField(
                        onChanged: (value) {
                          _username = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'Username'),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextField(
                        onChanged: (value){
                          _password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock_rounded,
                            color: Colors.black,
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(bottom: 15),
                      width: screen.width * 0.8,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 35),
                      height: screen.height * 0.06,
                      width: screen.width * 0.8,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () => loginPressed(),
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account ? ",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text('Sign up now',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  const TextFieldContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}
