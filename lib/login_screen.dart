// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mh_admin_panel/admin_home.dart';
import 'package:mh_admin_panel/custom_widgets.dart';
import 'package:mh_admin_panel/main.dart';
import 'package:mh_admin_panel/validation_hub.dart';
import 'package:mh_admin_panel/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  bool _showPassword = false;

  //handle login button

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          SizedBox(
              width: double.infinity,
              child: TopDecoration(
                height: mq.height * 0.25,
                text: 'Login',
                fontSize: 36,
              )),
          SizedBox(
            height: mq.height * 0.067,
          ),
          const WelcomeTextWidget(
            text: 'Welcome Back!',
            textSize: 26,
          ),
          SizedBox(
            height: mq.height * 0.05,
          ),

          //form for credentials

          Container(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
            child: Form(
              key: _formState,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email Required';
                      } else if (ValidationHub()
                          .isValidEmailFormat(value.trim())) {
                        return null;
                      } else {
                        return 'Invalid Email';
                      }
                    },
                  ),
                  SizedBox(
                    height: mq.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: _showPassword
                                  ? const Icon(Icons.visibility_off,
                                      color: Colors.green)
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.green,
                                    )),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          log(_password);
                          if (value!.isEmpty) {
                            return 'Password Required';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 4,
                      ),

                      //froget password button
                    ],
                  ),

                  SizedBox(
                    height: mq.height * 0.035,
                  ),

                  //login button

                  ElevatedButton(
                      onPressed: () {
                        if (_formState.currentState != null &&
                            _formState.currentState!.validate()) {
                          _formState.currentState!.save();

                          if (_email == "admin@medicalhub.com" &&
                              _password == "admin") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AdminHomeNav()));
                          } else {
                            CustomWidget.showSnackBar(
                                context, "Invalid Credentials");
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          fixedSize: Size(mq.width * 0.6, mq.height * 0.06)),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Don\'t have a account?',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                width: 4,
              ),

              //sign up buttton

              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Alert"),
                          content: const Text(
                              "Contact with Medical Hub to get admin account!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"))
                          ],
                        );
                      });
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color.fromARGB(255, 72, 37, 199),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decorationColor: Color.fromARGB(255, 17, 79, 130)),
                ),
              ),
            ],
          ),

          Expanded(
              child: BottomDecoration(
            height: mq.height * 0.24,
          ))
        ]),
      ),
    );
  }
}
