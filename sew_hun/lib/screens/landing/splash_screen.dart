import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/screens/landing/landing_screen.dart';
import 'package:sew_hun/screens/auth/login_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:validators/validators.dart' as V;

class SplashScreen extends ConsumerStatefulWidget {
  static String id = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.teal,
      child: Center(
        child: Text(
          'Splash ...',
          style: ThemeData.dark().textTheme.headline2,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    router();
  }

  void router(){
    Future.delayed(Duration(seconds: 2), () async {
      var token = await storage.read(key: kToken);
      if (!V.isNull(token) && V.isAlphanumeric(token!)) {
        // print('Landing ...');
        // print(token);
        Navigator.popAndPushNamed(context, LandingScreen.id);
        // return LandingScreen.id;
      } else {
        print('Login ...');
        Navigator.popAndPushNamed(context, LoginScreen.id);
        // return LoginScreen.id;
      }
    });
  }
}
