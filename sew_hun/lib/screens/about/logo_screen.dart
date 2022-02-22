import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class LogoScreen extends StatefulWidget {
  static String id = 'LogoScreen';

  const LogoScreen({Key? key}) : super(key: key);

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {

  Future<void> _shareImage() async {
    final bytes = await rootBundle.load('assets/img/et.jpg');
    final list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/et.jpg').create();
    // print(file.path);
    file.writeAsBytesSync(list);
    Share.shareFiles([file.path], text: 'https://sewhun.com');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).custom.bgColor,
          elevation: 0,
          leading: BackButton(
            color: Theme.of(context).custom.textColor,
          ),
          actions: [
            GestureDetector(
              onTap: _shareImage,
              child: Icon(
                Icons.share,
                color: Theme.of(context).custom.textColor,
              ),
            ),
            SizedBox(
              width: Theme.of(context).custom.smallPadding * 1.5,
            ),
          ],
        ),
        body: Hero(
          tag: 'logo',
          child: GestureDetector(
            onTap: (){
              // TODO: make only the pic visible and toggle the background
            },
            child: Container(
              height: size.height,
              width: size.width,
              color: Theme.of(context).custom.bgColor,
              child: Image(
                image: AssetImage('assets/img/et.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
