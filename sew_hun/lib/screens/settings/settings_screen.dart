import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/settings/settings_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/static.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static String id = 'SettingsScreen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.appBarColor,
        title: Text(
          'Settings',
          style: Theme.of(context).custom.textStyle,
        ),
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).custom.bgColor,
        ),
        child: settings.when(
          data: (data) {
            return ListView(
              children: [
                ListTile(
                  title: Text('Email subscription '),
                  subtitle: Text(
                    data.data!.isSubscribed! ? 'Yes' : 'No',
                  ),
                ),
                ListTile(
                  title: Text('Dark Mode'),
                  subtitle: Text(
                    data.data!.darkMode! ? 'Yes' : 'No',
                  ),
                ),
              ],
            );
          },
          error: (error, st) {
            return Container(
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
                      ref.refresh(settingsProvider);
                    },
                    child: Text('Reload'),
                  ),
                ],
              ),
            );
          },
          loading: () {
            return Center(
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
            );
          },
        ),
      ),
    );
  }
}
