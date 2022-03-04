// ignore_for_file: invalid_use_of_protected_member

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/auth/register_data_provider.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/screens/landing/landing_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:validators/validators.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static String id = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signedIn = ref.watch(isSignedInProvider.state);
    final signInError = ref.watch(signInErrorProvider.state);

    final registerData = ref.watch(registerDataProvider.notifier);

    ref.listen(
      isSignedInProvider.state,
      (a, b) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          if (signedIn.state == true) {
            Navigator.popAndPushNamed(context, LandingScreen.id);
            print('To LandingScreen...');
          } else if (signInError.state == true) {
            final error = ref.read(networkErrorProvider.state);
            // print(error.state.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.state!.type == DioErrorType.response
                      ? 'Use Valid Email and Password'
                      : 'Are You Connected to the Internet?',
                ),
              ),
            );
            error.state = null;
          }
        });
      },
    );
    // ref.listen(
    //   registerDataProvider,
    //   (a, b) {
    //     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //       print('Inside Listen');
    //       if (signedIn.state == true) {
    //         Navigator.popAndPushNamed(context, LandingScreen.id);
    //         print('To LandingScreen...');
    //       } else if (signInError.state == true) {
    //         print('SignIn Error Happened');
    //       }
    //     });
    //   },
    //   onError: (error, st) {
    //     print(error.toString());
    //   },
    // );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/et.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(defaultPadding),
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter Email Address',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onChanged: (value) {
                            registerData.addEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Please Enter An Email Address';
                            } else if (isEmail(value!) == false) {
                              return 'Please Enter A Valid Email Address';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            registerData.addPassword1(value);
                          },
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Enter A Password';
                            }
                            if (value!.isEmpty) {
                              return 'Enter A Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter Password Again',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            registerData.addPassword2(value);
                          },
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Enter A Password';
                            }
                            if (equals(registerData.state.password1,
                                    registerData.state.password2) ==
                                false) {
                              return 'Passwords Do Not Match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ref.read(registerDataProvider.notifier).register();
                          } else {
                            print('Validation Error');
                          }
                        },
                        child: Center(
                          child: Text('Register'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('Login');
                            },
                            child: Text(
                              'Login?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}