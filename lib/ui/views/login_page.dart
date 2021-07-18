import 'package:allskills/ui/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:allskills/utils/validator.dart';
import 'package:allskills/services/auth.dart';
import 'package:allskills/ui/views/profile_page.dart';
import 'package:allskills/ui/views/select_mode_page.dart';
import 'package:allskills/ui/views/register_page.dart';

class LoginPage extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const LoginPage({
    Key? key,
    required this.auth,
    required this.firestore,
  }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
                //height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: SingleChildScrollView(
                        child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 24.0, top: 24.0),
                            child: GestureDetector(
                              onTap: (() => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SelectModePage(),
                                    ),
                                  )),
                              child: Image.asset('assets/images/logo.png',
                                  height: 225, width: 225),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _emailTextController,
                                  focusNode: _focusEmail,
                                  validator: (value) => Validator.validateEmail(
                                    email: value,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabledBorder: new UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                TextFormField(
                                  controller: _passwordTextController,
                                  focusNode: _focusPassword,
                                  obscureText: true,
                                  validator: (value) =>
                                      Validator.validatePassword(
                                    password: value,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabledBorder: new UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.0),
                                _isProcessing
                                    ? CircularProgressIndicator()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Theme.of(context)
                                                              .accentColor)),
                                              onPressed: () async {
                                                _focusEmail.unfocus();
                                                _focusPassword.unfocus();

                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    _isProcessing = true;
                                                  });

                                                  final String? retVal = await Auth(
                                                          auth: widget.auth)
                                                      .signInUsingEmailAndPassword(
                                                    email: _emailTextController
                                                        .text,
                                                    password:
                                                        _passwordTextController
                                                            .text,
                                                  );
                                                  if (retVal == "Success") {
                                                    _emailTextController
                                                        .clear();
                                                    _passwordTextController
                                                        .clear();
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content:
                                                                Text(retVal!)));
                                                  }

                                                  setState(() {
                                                    _isProcessing = false;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                'JOIN THE GAME',
                                                style: TextStyle(
                                                    fontFamily: 'Asphaltic',
                                                    fontSize: 50,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          //SizedBox(width: 12.0),
                                          // Expanded(
                                          //   child: ElevatedButton(
                                          //     onPressed: () {
                                          //       Navigator.of(context).push(
                                          //         MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               SelectModePage(),
                                          //           //RegisterPage(),
                                          //         ),
                                          //       );
                                          //     },
                                          //     child: Text(
                                          //       'Register',
                                          //       style:
                                          //           TextStyle(color: Colors.white),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))))));
  }
}
