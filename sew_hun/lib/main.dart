import 'package:flutter/material.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog_list_screen.dart';
import 'package:sew_hun/screens/landing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Application - Biniam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        BlogListScreen.id: (context) => BlogListScreen(),
        BlogDetailScreen.id: (context) => BlogDetailScreen(),
      },
    );
  }
}
