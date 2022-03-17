import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/chat/text_message_to_send.dart';
import 'package:sew_hun/models/chat/voice_message_to_send.dart';
import 'package:sew_hun/providers/chat/chat_id_provider.dart';
import 'package:sew_hun/providers/chat/messages_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/chat/record_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:validators/validators.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  static String id = 'MessagesScreen';

  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  late Timer _timer;
  late AudioPlayer _player;
  late TextEditingController _textEditingController;
  bool _isPlaying = false;
  String _currentlyPlaying = '';

  String statusText = "";
  bool isComplete = false;

  late String recordFilePath;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _textEditingController = TextEditingController();
    _timer = Timer.periodic(
      Duration(seconds: 10),
      (Timer t) {
        ref.refresh(messagesProvider);
      },
    );
  }

  void play(
      {String? url =
          'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3'}) async {
    _player.play(url.toString());
    _isPlaying = true;
    _currentlyPlaying = url.toString();
    // _player.play(data.narration!.first.audio.toString());
  }

  @override
  void dispose() {
    _timer.cancel();
    _player.dispose();
    super.dispose();
  }

  alignMessage({required bool isAdmin, required bool fromAdmin}) {
    if (isAdmin == true && fromAdmin == true) {
      return MainAxisAlignment.end;
    } else if (isAdmin == true && fromAdmin == false) {
      return MainAxisAlignment.start;
    } else if (isAdmin == false && fromAdmin == false) {
      return MainAxisAlignment.end;
    } else if (isAdmin == false && fromAdmin == true) {
      return MainAxisAlignment.start;
    }
  }

  alignText({required bool isAdmin, required bool fromAdmin}) {
    if (isAdmin == true && fromAdmin == true) {
      return CrossAxisAlignment.end;
    } else if (isAdmin == true && fromAdmin == false) {
      return CrossAxisAlignment.start;
    } else if (isAdmin == false && fromAdmin == false) {
      return CrossAxisAlignment.end;
    } else if (isAdmin == false && fromAdmin == true) {
      return CrossAxisAlignment.start;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatId = ref.watch(chatIdProvider.notifier);
    final messages = ref.watch(messagesProvider);

    final message = TextMessageToSend(chatId: chatId.state);
    final voice = VoiceMessageToSend(chatId: chatId.state);
    final size = MediaQuery.of(context).size;
    final name = 'Chat';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.searchAppBarColor,
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
        title: GestureDetector(
          onTap: () => Navigator.pushNamed(context, RecordScreen.id),
          child: Text(
            name,
            style: Theme.of(context).custom.textStyle,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/img/bg.svg',
              fit: BoxFit.cover,
            ),
          ),
          messages.when(
            data: (messages) {
              if (messages.data!.length != 0) {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  itemCount: messages.data!.length,
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: alignMessage(
                        isAdmin: messages.isAdmin!,
                        fromAdmin: messages.data![index].isFromAdmin!,
                      ),
                      // messages.data![index].isFromAdmin == true && messages.isAdmin == true
                      //     ? MainAxisAlignment.end
                      //     : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.6,
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Theme.of(context).custom.chatContainerColor.withOpacity(0.8),
                          ),
                          child: Column(
                            // crossAxisAlignment:
                            //     messages.data![index].isFromAdmin == true
                            //         ? CrossAxisAlignment.start
                            //         : CrossAxisAlignment.end,
                            crossAxisAlignment: alignText(
                              isAdmin: messages.isAdmin!,
                              fromAdmin: messages.data![index].isFromAdmin!,
                            ),
                            children: [
                              Text(
                                messages.data![index].text.toString(),
                                textAlign: TextAlign.left,
                              ),
                              isNull(messages.data![index].audio) == true
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        print(baseUrl +
                                            messages.data![index].audio!
                                                .substring(1));
                                        if (_isPlaying) {
                                          _player.pause();
                                          setState(() {
                                            _isPlaying = false;
                                          });
                                        } else {
                                          setState(() {
                                            _isPlaying = true;
                                          });
                                          _player.play(
                                              'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3');
                                        }
                                        print('play-pause');
                                        // _player.play(baseUrl + messages.data![index].audio!.substring(1));
                                        // TODO: Uncomment this on production server
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: smallPadding),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          _isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Theme.of(context)
                                              .custom
                                              .bgThemeColor,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No messages to show',
                        style: Theme.of(context).custom.textStyle,
                      ),
                      SizedBox(
                        height: smallPadding,
                      ),
                      TextButton(
                        onPressed: () {
                          ref.refresh(messagesProvider);
                        },
                        child: Text('Reload'),
                      ),
                    ],
                  ),
                );
              }
            },
            error: (error, st) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      'Are you connected to the internet',
                      style: Theme.of(context).custom.textStyle,
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    TextButton(
                      onPressed: () {
                        ref.refresh(messagesProvider);
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
                // color: Theme.of(context).custom.appBarColor,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).custom.textColor,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('record sound');
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).custom.btnColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.mic,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: Theme.of(context).custom.textStyle,
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        print(value);
                        message.text = value.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // if no audio
                      ref.read(messageProvider.notifier).sendText(message);
                      setState(() {
                        message.text = '';
                        _textEditingController.text = '';
                      });
                      ref.refresh(messagesProvider);
                      // if audio
                      // ref.read(messageProvider.notifier).sendVoice(voice);
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 18,
                    ),
                    backgroundColor: Theme.of(context).custom.btnColor,
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

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  void playRecorder() {
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(recordFilePath, isLocal: true);
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
}

class MessageArgument {
  final isAdmin;

  MessageArgument({this.isAdmin});
}
