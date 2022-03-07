import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/user/user_provider.dart';
import 'package:sew_hun/screens/auth/login_screen.dart';
import 'package:sew_hun/screens/profile/edit_profile_screen.dart';
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
              // Tooltip(
              //   message: 'Logout',
              //   child: GestureDetector(
              //     onTap: () async {
              //       // final storage = FlutterSecureStorage();
              //       // await storage.delete(key: kToken);
              //       // ref.read(isSignedInProvider.notifier).state = false;
              //       // ref.read(signInErrorProvider.notifier).state = false;
              //       // ref.read(networkErrorProvider.notifier).state = null;
              //       //
              //       Navigator.pushNamed(
              //         context,
              //         EditProfileScreen.id,
              //       );
              //
              //       // Restart.restartApp();
              //     },
              //     child: Icon(
              //       Icons.edit,
              //       color: Theme.of(context).custom.textColor,
              //     ),
              //   ),
              // ),
              SizedBox(
                width: smallPadding,
              ),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(smallPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).custom.bgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            baseUrl + data.user!.profile!.photo!.substring(1),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.user!.username!,
                          style: Theme.of(context).custom.textStyle.copyWith(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: smallPadding,
                        ),
                        Text(
                          data.user!.email!,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        width: defaultPadding,
                      ),
                    ),
                  ],
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.chair_alt,
                  label: data.user!.profile!.role!.first.role!,
                  onTap: () {
                    print('Role');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.chair_alt,
                  label: 'First Name',
                  onTap: () {
                    print('Role');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.chair_alt,
                  label: 'Last Name',
                  onTap: () {
                    print('Role');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.phone_android,
                  label: data.user!.profile!.phone!,
                  onTap: () {
                    print('Phone');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.location_on_outlined,
                  label: data.user!.profile!.city!,
                  onTap: () {
                    print('City');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.location_city_outlined,
                  label: data.user!.profile!.subCity!,
                  onTap: () {
                    print('Sub City');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.location_city_outlined,
                  label: data.user!.profile!.specialName!,
                  onTap: () {
                    print('Special Name');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.print,
                  label: data.user!.profile!.bio!,
                  onTap: () {
                    print('Bio');
                  },
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.attach_money,
                  label: 'Payment: Unimplemented',
                  onTap: () {
                    print('Payments');
                  },
                ),
                Divider(),
                Expanded(child: SizedBox()),
                Divider(),
                ProfileTile(
                  icon: Icons.logout_rounded,
                  label: 'Logout',
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
                  textColor: Colors.red,
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
      error: (error, st) {
        return Scaffold(
          appBar: AppBar(
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

                  // Restart.restartApp();
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        child: Row(
          children: [
            SizedBox(
              width: defaultPadding,
            ),
            Icon(
              icon,
              size: 28,
              color: textColor ?? Theme.of(context).custom.textColor,
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Text(
              label,
              style: Theme.of(context).custom.textStyle.copyWith(
                    fontSize: 22,
                    color: textColor ?? Theme.of(context).custom.textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
