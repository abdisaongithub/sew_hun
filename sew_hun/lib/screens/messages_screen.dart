import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  static String id = 'MessagesScreen';

  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.appBarColor,
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
        title: Text(
          'Company Name',
          style: Theme.of(context).custom.textStyle,
        ),
      ),
      // backgroundColor: Theme.of(context).custom.bgColor,
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 60.0),
            itemExtent: 20,
            scrollDirection: Axis.vertical,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              // return Container(
              //   height: 100,
              //   decoration: BoxDecoration(
              //     color: Colors.teal,
              //     border: Border.all(color: Colors.white, width: 2),
              //   ),
              //   child: Text('Hello'),
              // );
              return Container();
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).custom.appBarColor,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).custom.textColor,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: Theme.of(context).custom.textStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
