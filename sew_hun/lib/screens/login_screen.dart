import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/models/auth/auth_token.dart';
import 'package:sew_hun/providers/auth/credentials_provider.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/screens/landing_screen.dart';
import 'package:sew_hun/static.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final credsNotifier = ref.watch(credentialsProvider.notifier);
    final signedIn = ref.watch(isSignedInProvider.state);
    final signInError = ref.watch(signInErrorProvider.state);

    final auth = ref.listen(
      newAuth,
      (a, b) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {

          print('Inside Listen');
          if(signedIn.state == true){
            Navigator.popAndPushNamed(context, LandingScreen.id);
            print('To LandingScreen...');
          } else if (signInError.state == true){
            print('Error Happened');
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
          Center(
            child: Container(
              width: 300,
              height: 400,
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                        onChanged: (value) {
                          // print(value);
                          // username = value;
                          credsNotifier.setEmail(value);
                          print(credsNotifier.state[kEmail]);
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          // print(value);
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
                          ref
                              .read(credentialsProvider.notifier)
                              .setPassword(value);
                          print(credsNotifier.state[kPassword]);
                        },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          // print(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final a = ref.read(newAuth.notifier);
                        a.login();
                        print(a.toString());
                        print('called login');
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
                            print('register');
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
        ],
      ),
    );
  }
}
