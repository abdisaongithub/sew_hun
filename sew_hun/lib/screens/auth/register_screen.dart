import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sew_hun/models/auth/register.dart';
import 'package:sew_hun/providers/auth/register_data_provider.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/landing/menu_screen.dart';
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
            Navigator.popAndPushNamed(context, MenuScreen.id);
          } else if (signInError.state == true) {
            final error = ref.read(networkErrorProvider.state);
            // print(error.state.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.state!.response!.statusCode.toString().startsWith('4')
                      ? error.state!.response!.data
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
            child: SvgPicture.asset(
              'assets/img/bg.svg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(defaultPadding),
                padding: const EdgeInsets.all(defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/img/register.svg',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
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
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Enter A Password';
                            }
                            if (value!.isEmpty) {
                              return 'Enter A Password';
                            }
                            if (isNumeric(value)) {
                              return 'Password can\'t be numbers only';
                            }
                            if (isAlpha(value)) {
                              return 'Password can\'t be letters only';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Confirm Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            registerData.addPassword2(value);
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.go,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onEditingComplete: () {
                            if (_formKey.currentState!.validate()) {
                              ref.read(registerDataProvider.notifier).register(
                                    register: Register(
                                      email: registerData.state.email,
                                      password1: registerData.state.password1,
                                      password2: registerData.state.password2,
                                    ),
                                  );
                            } else {
                              print('Validation Error');
                            }
                          },
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
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            ref.read(registerDataProvider.notifier).register(
                              register: Register(
                                email: registerData.state.email,
                                password1: registerData.state.password1,
                                password2: registerData.state.password2,
                              ),
                            );
                          } else {
                            print('Validation Error');
                          }
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).custom.btnColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text('Register'),
                          ),
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
                              Navigator.pop(context);
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
