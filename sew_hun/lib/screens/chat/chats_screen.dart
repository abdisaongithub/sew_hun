import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/chat/admin_chooser_screen.dart';
import 'package:sew_hun/providers/chat/admins_provider.dart';
import 'package:sew_hun/providers/chat/chat_id_provider.dart';
import 'package:sew_hun/providers/chat/chats_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/chat/messages_screen.dart';
import 'package:sew_hun/static.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static String id = 'ChatsScreen';

  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(chatsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.appBarColor,
        title: Text(
          'Chats',
          style: Theme.of(context).custom.textStyle,
        ),
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
      ),
      body: chats.when(
        data: (data) {
          if (data.chats!.isNotEmpty) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: data.chats!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: 50,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image(
                        image: NetworkImage(
                          data.chats![index].admin!.profile!.photo.toString(),
                        ),
                        fit: BoxFit.cover,
                        errorBuilder: (c, o, s) {
                          return Image(
                            image: AssetImage('assets/img/et.jpg'),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      data.chats![index].admin!.username.toString(),
                      style: Theme.of(context).custom.textStyle.copyWith(
                            fontSize: 22,
                          ),
                    ),
                    subtitle: Text(
                      'Admin',
                    ),
                    onTap: () {
                      ref.read(chatIdProvider.state).state =
                          data.chats![index].id!;
                      Navigator.pushNamed(
                        context,
                        MessagesScreen.id,
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create a chat with one of the admins?',
                    style: Theme.of(context).custom.textStyle,
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AdminChooserScreen.id);
                    },
                    child: Text('Create'),
                  ),
                ],
              ),
            );
          }
        },
        error: (error, st) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Are you connected to the internet?',
                  style: Theme.of(context).custom.textStyle,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                TextButton(
                  onPressed: () {
                    ref.refresh(chatsProvider);
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).custom.textColor,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.refresh(chatsProvider);
          print('Refreshing...');
        },
        child: Icon(Icons.refresh),
        // TODO: when empty use this to create/initiate a chat with an admin
      ),
    );
  }
}
