import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/user/user_provider.dart';
import 'package:sew_hun/screens/auth/log_out_provider.dart';
import 'package:sew_hun/screens/auth/login_screen.dart';
import 'package:sew_hun/static.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static String id = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userProvider).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              data.user!.username!,
              style: Theme.of(context).custom.textStyle.copyWith(
                    color: Theme.of(context).custom.textColor,
                  ),
            ),
            backgroundColor: Theme.of(context).custom.appBarColor,
            leading: BackButton(
              color: Theme.of(context).custom.textColor,
            ),
            actions: [
              GestureDetector(
                onTap: () async {
                  final storage = FlutterSecureStorage();
                  await storage.delete(key: kToken);
                  ref.read(isSignedInProvider.notifier).state = false;
                  ref.read(signInErrorProvider.notifier).state = false;
                  ref.read(networkErrorProvider.notifier).state = null;

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.id,
                    (route) => route.currentResult == LoginScreen.id,
                  );

                },
                child: Icon(
                  Icons.logout,
                  color: Theme.of(context).custom.textColor,
                ),
              ),
              SizedBox(
                width: smallPadding,
              ),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).custom.bgColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                      ),
                      child: Image.network(
                        data.user!.profile!.photo!,
                        errorBuilder: (context, obj, st) {
                          return Image.asset('assets/img/et.jpg');
                        },
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          data.user!.username!,
                        ),
                        Text(
                          data.user!.firstName!,
                        ),
                        Text(
                          data.user!.email!,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      error: (error, st) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Are you connected to the Internet?',
                  style: Theme.of(context).custom.textStyle,
                ),
                SizedBox(
                  height: smallPadding,
                ),
                TextButton(
                  onPressed: () {
                    ref.refresh(userProvider);
                  },
                  child: Text('Reload'),
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: defaultPadding,
                ),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }
}
