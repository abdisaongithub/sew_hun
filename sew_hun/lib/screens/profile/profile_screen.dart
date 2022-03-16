import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/user/user_provider.dart';
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
              Tooltip(
                message: 'Edit Profile',
                child: GestureDetector(
                  onTap: () async {
                    // final storage = FlutterSecureStorage();
                    // await storage.delete(key: kToken);
                    // ref.read(isSignedInProvider.notifier).state = false;
                    // ref.read(signInErrorProvider.notifier).state = false;
                    // ref.read(networkErrorProvider.notifier).state = null;
                    //
                    // Navigator.pushNamed(
                    //   context,
                    //   EditProfileScreen.id,
                    // );

                    // Restart.restartApp();
                  },
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).custom.textColor,
                  ),
                ),
              ),
              SizedBox(
                width: defaultPadding,
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
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                          image: CachedNetworkImageProvider(
                            data.user!.profile!.photo != null
                                ? data.user!.profile!.photo!
                                : '',
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip,
                              ),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: smallPadding,
                        ),
                        // Text(
                        //   data.user!.email!,
                        //   style: Theme.of(context).custom.textStyle.copyWith(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //     overflow: TextOverflow.clip,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: defaultPadding,
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
                  hint: 'role',
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.chair_alt,
                  label: data.user!.firstName.toString(),
                  onTap: () {
                    print('');
                  },
                  hint: 'First Name',
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.chair_alt,
                  label: 'Last Name',
                  onTap: () {
                    print('Role');
                  },
                  hint: 'Last Name',
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.phone_android,
                  label: data.user!.profile!.phone!,
                  onTap: () {
                    print('Phone');
                  },
                  hint: 'Phone Number',
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.location_on_outlined,
                  label: data.user!.profile!.city!,
                  onTap: () {
                    print('City');
                  },
                  hint: 'City',
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.location_city_outlined,
                  label: data.user!.profile!.subCity!,
                  onTap: () {
                    print('Sub City');
                  },
                  hint: 'Sub City',
                ),
                Divider(),
                ProfileTile(
                  icon: Icons.menu_book,
                  label: data.user!.profile!.bio!,
                  onTap: () {
                    print('Bio');
                  },
                  hint: 'Bio',
                ),
                Divider(),
                // ProfileTile(
                //   icon: Icons.attach_money,
                //   label: 'Payment: Unimplemented',
                //   onTap: () {
                //     print('Payments');
                //   }, hint: 'Payments',
                // ),
                // Divider(),
                SizedBox(
                  height: 50,
                ),
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
                  hint: 'Logout',
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
  final String hint;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.textColor,
    required this.hint,
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
            hint.isNotEmpty
                ? Text(
                    label,
                    style: Theme.of(context).custom.textStyle.copyWith(
                          fontSize: 22,
                          color:
                              textColor ?? Theme.of(context).custom.textColor,
                        ),
                  )
                : Text(
                    hint,
                    style: Theme.of(context).custom.textStyle.copyWith(
                          fontSize: 22,
                          color: textColor ??
                              Theme.of(context)
                                  .custom
                                  .textColor
                                  .withOpacity(0.8),
                        ),
                  ),
          ],
        ),
      ),
    );
  }
}
