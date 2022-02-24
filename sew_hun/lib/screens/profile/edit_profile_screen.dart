import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/user/user_provider.dart';
import 'package:sew_hun/screens/auth/login_screen.dart';
import 'package:sew_hun/static.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String id = 'EditProfileScreen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController roleController = TextEditingController(); // TODO: Include names too
  TextEditingController paymentController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController subCityController = TextEditingController();
  TextEditingController specialNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

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
                EditProfileTile(
                  icon: Icons.chair_alt,
                  initialValue: data.user!.profile!.role!.first.role!,
                  onTap: () {
                    print('Role');
                  },
                ),
                Divider(),
                EditProfileTile(
                  icon: Icons.attach_money,
                  initialValue: 'Payment: Unimplemented',
                  onTap: () {
                    print('Payments');
                  },
                  // controller: paymentController,
                ),
                Divider(),
                EditProfileTile(
                  icon: Icons.phone_android,
                  initialValue: data.user!.profile!.phone!,
                  onTap: () {
                    print('Phone');
                  },
                  // controller: phoneController,
                ),
                Divider(),
                EditProfileTile(
                  icon: Icons.location_on_outlined,
                  initialValue: data.user!.profile!.city!,
                  onTap: () {
                    print('City');
                  },
                  // controller: cityController,
                ),
                Divider(),
                EditProfileTile(
                  icon: Icons.location_city_outlined,
                  initialValue: data.user!.profile!.subCity!,
                  onTap: () {
                    print('Sub City');
                  },
                  // controller: subCityController,
                ),
                Divider(),
                EditProfileTile(
                  icon: Icons.location_city_outlined,
                  initialValue: data.user!.profile!.specialName!,
                  onTap: () {
                    print('Special Name');
                  },
                  // controller: specialNameController,
                ),
                Divider(),
                EditProfileTile(
                  icon: Icons.print,
                  initialValue: data.user!.profile!.bio!,
                  onTap: () {
                    print('Bio');
                  },
                  // controller: bioController,
                ),
                Divider(),
                Expanded(child: SizedBox()),
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

class EditProfileTile extends StatelessWidget {
  final IconData icon;
  final String initialValue;
  final VoidCallback onTap;
  final Color? textColor;
  final TextEditingController? controller;

  const EditProfileTile({
    Key? key,
    required this.icon,
    required this.initialValue,
    required this.onTap,
    this.textColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: defaultPadding,
          ),
          Icon(
            icon,
            size: 28,
          ),
          SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              style: Theme.of(context).custom.textStyle.copyWith(
                    fontSize: 22,
                  ),
              cursorColor: Theme.of(context).custom.textColor,
              focusNode: FocusNode(),
              initialValue: initialValue,
            ),
          ),
        ],
      ),
    );
  }
}
