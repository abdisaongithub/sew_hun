import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/user/user_provider.dart';
import 'package:sew_hun/screens/auth/login_screen.dart';
import 'package:sew_hun/screens/components/LoadingError.dart';
import 'package:sew_hun/screens/components/LoadingIndicator.dart';
import 'package:sew_hun/static.dart';
import 'package:validators/validators.dart';

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
          // appBar: AppBar(
          //   title: Text(
          //     data.user!.username!,
          //     style: Theme.of(context).custom.textStyle.copyWith(
          //           color: Theme.of(context).custom.textColor,
          //         ),
          //   ),
          //   backgroundColor: Theme.of(context).custom.appBarColor,
          //   leading: BackButton(
          //     color: Theme.of(context).custom.textColor,
          //   ),
          //   actions: [
          //     Tooltip(
          //       message: 'Edit Profile',
          //       child: GestureDetector(
          //         onTap: () async {
          //           // final storage = FlutterSecureStorage();
          //           // await storage.delete(key: kToken);
          //           // ref.read(isSignedInProvider.notifier).state = false;
          //           // ref.read(signInErrorProvider.notifier).state = false;
          //           // ref.read(networkErrorProvider.notifier).state = null;
          //           //
          //           // Navigator.pushNamed(
          //           //   context,
          //           //   EditProfileScreen.id,
          //           // );
          //
          //           // Restart.restartApp();
          //         },
          //         child: Icon(
          //           Icons.edit,
          //           color: Theme.of(context).custom.textColor,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: defaultPadding,
          //     ),
          //   ],
          // ),
          body: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/img/bg.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                decoration: BoxDecoration(
                    // color: Theme.of(context).custom.bgColor,
                    ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'About Me',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).custom.searchAppBarColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: CachedNetworkImageProvider(
                              data.user!.profile!.photo != null
                                  ? data.user!.profile!.photo.toString()
                                  : '',
                            ),
                          ),
                          SizedBox(
                            width: smallPadding,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 180,
                                child: Text(
                                  data.user!.username!, // TODO: Use name here
                                  style: Theme.of(context)
                                      .custom
                                      .textStyle
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Text(
                                data.user!.email!,
                                style:
                                    Theme.of(context).custom.textStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.clip,
                                        ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: defaultPadding,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   EditProfileScreen.id,
                              // );
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).custom.searchAppBarColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProfileTile(
                            value: data.user!.profile!.role!.first.role!,
                            onTap: () {
                              print('Role');
                            },
                            label: 'role',
                          ),
                          WhiteDivider(),
                          ProfileTile(
                            value: data.user!.firstName.toString(),
                            onTap: () {
                              print('');
                            },
                            label: 'First Name',
                          ),
                          WhiteDivider(),
                          ProfileTile(
                            value: 'Last Name',
                            onTap: () {
                              print('Role');
                            },
                            label: 'Last Name',
                          ),
                          WhiteDivider(),
                          ProfileTile(
                            value: data.user!.profile!.phone!,
                            onTap: () {
                              print('Phone');
                            },
                            label: 'Phone Number',
                          ),
                          WhiteDivider(),
                          ProfileTile(
                            value: data.user!.profile!.city!,
                            onTap: () {
                              print('City');
                            },
                            label: 'City',
                          ),
                          WhiteDivider(),
                          ProfileTile(
                            value: data.user!.profile!.subCity!,
                            onTap: () {
                              print('Sub City');
                            },
                            label: 'Sub City',
                          ),
                          WhiteDivider(),
                          ProfileTile(
                            value: data.user!.profile!.bio!,
                            onTap: () {
                              print('Bio');
                            },
                            label: 'Bio',
                          ),
                        ],
                      ),
                    ),

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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).custom.btnColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (error, st) {
        return LoadingError(
            onTap: () {
              ref.refresh(userProvider);
            },
        );
      },
      loading: () {
        return LoadingIndicator();
      },
    );
  }
}


class WhiteDivider extends StatelessWidget {
  const WhiteDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,
      thickness: 1.5,
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String value;
  final String? label;
  final VoidCallback onTap;
  final Color? textColor;
  final IconData? icon;

  const ProfileTile({
    Key? key,
    required this.value,
    required this.onTap,
    this.label,
    this.textColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isNull(label) ? '' : label!,
              style: Theme.of(context).custom.textStyle.copyWith(
                    fontSize: 12,
                  ),
            ),
            Text(
              value,
              style: Theme.of(context).custom.textStyle.copyWith(
                    fontSize: 18,
                    color: textColor ?? Theme.of(context).custom.textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
