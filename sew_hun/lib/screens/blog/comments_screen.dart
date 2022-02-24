import 'package:flutter/material.dart';
import 'package:sew_hun/models/blog/post.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/static.dart';

class CommentsScreen extends StatefulWidget {
  static String id = 'CommentsScreen';

  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CommentArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).custom.appBarColor,
        title: Text(
          'Comments',
          style: Theme.of(context).custom.textStyle,
        ),
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: smallPadding,
          left: smallPadding,
          right: smallPadding,
        ),
        itemCount: args.comments.length,
        itemBuilder: (context, index) {
          if (args.comments.length == 0) {
            return Text('No Comments Yet');
          }
          return ListTile(
            title: Text(args.comments[index].comment!),
            subtitle: Text(args.comments[index].user!.username!),
            leading: CircleAvatar(
              radius: 25,
              foregroundImage: NetworkImage(args.comments[index].user!.profile!.photo!,
              ),
            ),
          );
        },
      ),
    );
  }
}

// TODO: implement comment feature

class CommentArgument {
  final List<Comments> comments;

  CommentArgument({required this.comments});
}
