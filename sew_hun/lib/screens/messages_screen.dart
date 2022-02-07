import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/chat/messages_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/static.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  static String id = 'MessagesScreen';

  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  // bool adminChecker(int index){}

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 10),
      (Timer t) {
        ref.refresh(messagesProvider);
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final messages = ref.watch(messagesProvider);
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
          messages.when(
            data: (data) {
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 60.0),
                itemCount: data.data!.length,
                scrollDirection: Axis.vertical,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: data.data![index].isFromAdmin == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.6,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Theme.of(context)
                                .custom
                                .textColor
                                .withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Text(data.data![index].text.toString()),
                      ),
                    ],
                  );
                },
              );
            },
            error: (error, st) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    ref.refresh(messagesProvider);
                  },
                  child: Text('Reload'),
                ),
              );
            },
            loading: () {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
                top: 10,
              ),
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
