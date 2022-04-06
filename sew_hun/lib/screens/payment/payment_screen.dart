import 'package:flutter/material.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';

class PaymentsScreen extends StatefulWidget {
  static String id = 'PaymentsScreen';

  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.bgColor,
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
        title: Text(
          'Payments',
          style: Theme.of(context).custom.textStyle.copyWith(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Coming Soon ...', style: Theme.of(context).custom.textStyle.copyWith(fontSize: 22),),
          ),
        ],
      ),
    );
  }
}
