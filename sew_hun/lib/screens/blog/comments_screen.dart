import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/models/blog/post.dart';
import 'package:sew_hun/providers/blog/comments_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/chat/record_screen.dart';
import 'package:sew_hun/static.dart';

class CommentsScreen extends ConsumerStatefulWidget {
  static String id = 'CommentsScreen';

  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends ConsumerState<CommentsScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as CommentArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.appBarColor,
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
        title: GestureDetector(
          onTap: () => Navigator.pushNamed(context, RecordScreen.id),
          child: Text(
            'Comments',
            style: Theme.of(context).custom.textStyle,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.only(
              top: smallPadding,
              left: smallPadding,
              right: smallPadding,
            ),
            itemCount: args.comments.length,
            itemBuilder: (context, index) {
              if (args.comments.length == 0) {
                return ListTile(
                  title: Text('No Comments Yet'),
                );
              }
              return ListTile(
                title: Text(args.comments[index].comment!),
                subtitle: Text(args.comments[index].user!.username!),
                leading: CircleAvatar(
                  radius: 25,
                  foregroundImage: NetworkImage(
                    args.comments[index].user!.profile!.photo!,
                  ),
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
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "Write your comment...",
                        hintStyle: Theme.of(context).custom.textStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      ref.read(commentProvider.notifier).sendComment(
                            comment: _textEditingController.text,
                            post_id: args.id,
                          );
                    },
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

class CommentArgument {
  final List<Comments> comments;
  final int id;

  CommentArgument({
    required this.comments,
    required this.id,
  });
}
