import 'package:flutter/material.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/static.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'First Name',
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
            onTap: () {
              print('Logout');
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
      body: Center(
        child: Text('Implement Profile'),
      ),
    );
  }
}
