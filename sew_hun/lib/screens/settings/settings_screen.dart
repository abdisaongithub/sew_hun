import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/settings/settings_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';

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
        decoration: BoxDecoration(color: Theme.of(context).custom.bgColor),
        child: settings.when(
            data: (data) {
              ListView.builder(
                  itemExtent: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        data.data!.darkMode.toString(),
                      ),
                    );
                  });
            },
            error: (error, st) {},
            loading: () {}),
      ),
    );
  }
}
