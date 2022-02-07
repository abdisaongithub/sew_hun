import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/about_screen.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog_list_screen.dart';
import 'package:sew_hun/screens/chats_screen.dart';
import 'package:sew_hun/screens/comments_screen.dart';
import 'package:sew_hun/screens/landing_screen.dart';
import 'package:sew_hun/screens/login_screen.dart';
import 'package:sew_hun/screens/logo_screen.dart';
import 'package:sew_hun/screens/messages_screen.dart';
import 'package:sew_hun/screens/profile_screen.dart';
import 'package:sew_hun/screens/splash_screen.dart';
import 'package:sew_hun/screens/youtube_video_player_screen.dart';
import 'package:sew_hun/screens/youtube_videos_screen.dart';


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
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp(
          title: 'Sew Hun Kesewm Sew Hun',
          debugShowCheckedModeBanner: false,
          theme: ref.watch(lightThemeProvider),
          darkTheme: ref.watch(darkThemeProvider),
          themeMode: ref.watch(themeModeProvider),
          initialRoute: LandingScreen.id,
          routes: {
            '/': (context) => SplashScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            LandingScreen.id: (context) => LandingScreen(),
            BlogListScreen.id: (context) => BlogListScreen(),
            BlogDetailScreen.id: (context) => BlogDetailScreen(),
            CommentsScreen.id: (context) => CommentsScreen(),
            ProfileScreen.id: (context) => ProfileScreen(),
            MessagesScreen.id: (context) => MessagesScreen(),
            ChatsScreen.id: (context) => ChatsScreen(),
            AboutScreen.id: (context) => AboutScreen(),
            LogoScreen.id: (context) => LogoScreen(),
            YoutubeVideosScreen.id: (context) => YoutubeVideosScreen(),
            YoutubeVideoPlayerScreen.id: (context) => YoutubeVideoPlayerScreen(),
          },
        );
      },
    );
  }
}
