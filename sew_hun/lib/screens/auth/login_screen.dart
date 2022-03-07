import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/auth/login_credentials_provider.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/screens/auth/register_screen.dart';
import 'package:sew_hun/screens/landing/landing_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:validators/validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final credentials = ref.watch(credentialsProvider.notifier);
    final signedIn = ref.watch(isSignedInProvider.state);
    final signInError = ref.watch(signInErrorProvider.state);

    ref.listen(
      authTokenProvider,
      (a, b) {
        print('About to bind');
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          if (signedIn.state == true) {
            Navigator.pushNamed(context, LandingScreen.id);
            // print('To LandingScreen...');
          } else if (signInError.state == true) {
            final error = ref.read(networkErrorProvider.state);
            // print(error.state.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.state!.type == DioErrorType.response
                      ? 'Check Email and Password'
                      : 'Are You Connected to the Internet?',
                ),
              ),
            );
            error.state = null;
          }
        });
      },
    );

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
              // crossAxisAlignment: CrossAxisAlignment.start,
              child: Container(
                margin: EdgeInsets.all(defaultPadding),
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding),
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Login',
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
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            credentials.setEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Please Enter An Email';
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
                          textInputAction: TextInputAction.none,
                          onChanged: (value) {
                            credentials.setPassword(value);
                          },
                          keyboardType: TextInputType.text,
                          // validator: (value) {}, TODO: Implement this validation
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ref.read(authTokenProvider.notifier).login();
                          } else {
                            print('Validation Error');
                          }
                        },
                        child: Center(
                          child: Text('Login'),
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
                              Navigator.pushNamed(
                                context,
                                RegisterScreen.id,
                              );
                            },
                            child: Text(
                              'Register?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
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
