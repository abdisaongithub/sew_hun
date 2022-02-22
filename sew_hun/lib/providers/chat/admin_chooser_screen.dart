import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/providers/chat/admins_provider.dart';
import 'package:sew_hun/providers/chat/chats_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/static.dart';

class AdminChooserScreen extends ConsumerStatefulWidget {
  static String id = 'AdminChooserScreen';

  const AdminChooserScreen({Key? key}) : super(key: key);

  @override
  _AdminChooserScreenState createState() => _AdminChooserScreenState();
}

class _AdminChooserScreenState extends ConsumerState<AdminChooserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).custom.appBarColor,
          title: Text(
            'Admins',
            style: Theme.of(context).custom.textStyle,
          ),
          leading: BackButton(
            color: Theme.of(context).custom.textColor,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ref.watch(adminsProvider).when(
            data: (data) {
              return ListView.builder(
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(
                        baseUrl +
                            data.data![index].profile!.photo
                                .toString()
                                .substring(1),
                      ),
                    ),
                    title: Text(
                      data.data![index].username.toString(),
                      style: Theme.of(context).custom.textStyle,
                    ),
                    onTap: () {
                      // TODO: Create the chat and get back to the previous screen
                      ref
                          .read(
                              createChatProvider(data.data![index].id!.toInt()))
                          .when(
                        data: (data) {
                          print('data');
                        },
                        error: (error, st) {
                          print('error');
                        },
                        loading: () {
                          print('loading');
                        },
                      );
                      Navigator.pop(context);
                      ref.refresh(chatsProvider);
                    },
                  );
                },
              );
            },
            error: (error, st) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(100),
                  color: Colors.red,
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
                          ref.refresh(adminsProvider);
                        },
                        child: Text('Reload'),
                      ),
                    ],
                  ),
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
        ));
  }
}
