import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sew_hun/providers/chat/admin_chooser_screen.dart';
import 'package:sew_hun/providers/chat/chat_id_provider.dart';
import 'package:sew_hun/providers/chat/chats_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/chat/messages_screen.dart';
import 'package:sew_hun/screens/components/LoadingError.dart';
import 'package:sew_hun/screens/components/LoadingIndicator.dart';
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
    return Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/img/bg.svg',
              fit: BoxFit.cover,
            ),
          ),
          chats.when(
            data: (data) {
              if (data.chats!.isNotEmpty) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: ListView.builder(
                    itemCount: data.chats!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(chatIdProvider.state).state =
                              data.chats![index].id!;
                          Navigator.pushNamed(
                            context,
                            MessagesScreen.id,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10,),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green,
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        data.isAdmin!
                                            ? data.chats![index].client!.profile!
                                                .photo
                                                .toString()
                                            : data.chats![index].admin!.profile!
                                                .photo!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: smallPadding,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        data.isAdmin!
                                            ? data.chats![index].client!.username
                                                .toString()
                                            : data.chats![index].admin!.username
                                                .toString(),
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .custom
                                            .textStyle
                                            .copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: smallPadding,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        data.isAdmin! ? 'Admin' : 'Client',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
            error: (error, st) => LoadingError(onTap: (){ref.refresh(chatsProvider);},),
            loading: () => LoadingIndicator(),
          ),
        ],
    );
  }
}
