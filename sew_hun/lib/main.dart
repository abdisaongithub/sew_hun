import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog_list_screen.dart';
import 'package:sew_hun/screens/landing_screen.dart';
import 'package:sew_hun/screens/login_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
      initialRoute: LoginScreen.id,
      routes: {
        '/': (context) => LoginScreen(),
        LandingScreen.id: (context) => LandingScreen(),
        BlogListScreen.id: (context) => BlogListScreen(),
        BlogDetailScreen.id: (context) => BlogDetailScreen(),
      },
    );
  }
}
