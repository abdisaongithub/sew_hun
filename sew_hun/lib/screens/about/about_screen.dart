import 'package:flutter/material.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/about/logo_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  static String id = 'AboutScreen';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.appBarColor,
        title: Text(
          'About Us',
          style: Theme.of(context).custom.textStyle,
        ),
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(Theme.of(context).custom.smallPadding),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'ሰው ሁን ከሰውም ሰው ሁን',
                style: Theme.of(context).custom.textStyle.copyWith(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, LogoScreen.id);
                },
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    width: size.width * 0.75,
                    height: size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(
                        size.width * 0.75,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/img/et.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'የሥነልቦና የማማከርና የሥልጠና ተቋም',
                style: Theme.of(context).custom.textStyle.copyWith(
                      fontSize: 20,
                    ),
                textAlign: TextAlign.justify,
              ),
              Divider(
                color: Theme.of(context).custom.textColor,
              ),
              Text(
                'በአእምሮ፣ በመንፈስ እና በማኅበራዊ ሕይወት የተሟላ ጤና ያለው ትውልድ ለመገንባት የድርሻችንን ኃላፊነት መወጣት ነው፡፡',
                style: Theme.of(context).custom.textStyle.copyWith(
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Theme.of(context).custom.textColor,
              ),
              SizedBox(
                height: Theme.of(context).custom.smallPadding,
              ),
              Text(
                'Call Us',
                style: Theme.of(context).custom.textStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: Theme.of(context).custom.smallPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: Theme.of(context).custom.textColor,
                  ),
                  SizedBox(
                    width: Theme.of(context).custom.smallPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '+251913654294',
                      );
                      launch(launchUri.toString())
                          .then((value) => print(value))
                          .onError((error, stackTrace) => print('error'));
                      // print('+251913654294');
                    },
                    child: Text(
                      '+251913654294',
                      style: Theme.of(context).custom.textStyle.copyWith(
                            fontSize: 18,
                        color: Colors.blue,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: Theme.of(context).custom.smallPadding,
                  ),
                  Text(
                    'Mobile',
                    style: Theme.of(context).custom.textStyle.copyWith(
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: Theme.of(context).custom.smallPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: Theme.of(context).custom.textColor,
                  ),
                  SizedBox(
                    width: Theme.of(context).custom.smallPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '+251942410483',
                      );
                      launch(launchUri.toString())
                          .then((value) => print(value))
                          .onError((error, stackTrace) => print('error'));
                      // print('+251913654294');
                    },
                    child: Text(
                      '+251942410483',
                      style: Theme.of(context).custom.textStyle.copyWith(
                            fontSize: 18,
                        color: Colors.blue,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: Theme.of(context).custom.smallPadding,
                  ),
                  Text(
                    'Office',
                    style: Theme.of(context).custom.textStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}