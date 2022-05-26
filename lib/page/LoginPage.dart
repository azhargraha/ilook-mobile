import 'dart:html';

import 'package:flutter/material.dart';

  class LoginPage extends StatelessWidget {
    const LoginPage({Key? key}) : super(key: key);
    

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: screen.width * 0.8,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Welcome to iLook',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom:35),
                      child: Text(
                        'Sign in to continue',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey),
                      ),
                    ), 
                    TextFieldContainer(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: 'Username'
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextField(
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
                        onPressed: (){},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 35),
                      height: screen.height * 0.06,
                      width: screen.width * 0.8,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(color: Colors.grey[600], fontSize: 18)
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Sign up now',
                            style: TextStyle(color: Colors.grey[800], fontSize: 18, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ],
                    )
                  ],
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
    Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)
          ),
        child: child,
      );
    }
  }