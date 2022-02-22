import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  static String id = 'CommentsScreen';
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Comments'),),);
  }
}
