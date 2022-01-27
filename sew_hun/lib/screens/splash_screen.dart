import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/screens/splash_screen_provider.dart';
import 'package:sew_hun/screens/landing_screen.dart';
import 'package:sew_hun/screens/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String id = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    // final isLoggedIn = ref.watch(isSignedInProvider.state);
    // Future.delayed(Duration(seconds: 5), (){
    //   if (isLoggedIn.state == true) {
    //     print('Landing ...');
    //     return LandingScreen.id;
    //   } else {
    //     print('Login ...');
    //     return LoginScreen.id;
    //   }
    // });

    // TODO: Navigate to either Login on Landing screen based on auth status

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

  }
}
