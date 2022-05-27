import 'package:flutter/material.dart';
import 'package:mobel/page/LoginPage.dart';

  class RegisterPage extends StatelessWidget {
    const RegisterPage({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context){
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
                      child: Image.asset('assets/images/logo.png'),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Lets Get Started',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 35),
                        child: Text(
                          'Create an account to continue',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
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
                            hintText: 'Nama'),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.contact_mail_outlined,
                              color: Colors.black,
                            ),
                            hintText: 'Username',
                          ),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextField(
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
                      TextFieldContainer(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.local_phone,
                              color: Colors.black,
                            ),
                            hintText: 'No Telepon',
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
                          onPressed: () {},
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account ? ",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, 
                                MaterialPageRoute(builder: (context) {
                                  return RegisterPage();
                                })
                              );
                            },
                            child: Text('Sign in',
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: size.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: child,
      );
    }
}
