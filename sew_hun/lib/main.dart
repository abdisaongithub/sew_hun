import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/chat/admin_chooser_screen.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/about/about_screen.dart';
import 'package:sew_hun/screens/blog/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog/blog_list_screen.dart';
import 'package:sew_hun/screens/chat/chats_screen.dart';
import 'package:sew_hun/screens/blog/comments_screen.dart';
import 'package:sew_hun/screens/chat/record_screen.dart';
import 'package:sew_hun/screens/landing/landing_screen.dart';
import 'package:sew_hun/screens/auth/login_screen.dart';
import 'package:sew_hun/screens/about/logo_screen.dart';
import 'package:sew_hun/screens/chat/messages_screen.dart';
import 'package:sew_hun/screens/profile/profile_screen.dart';
import 'package:sew_hun/screens/auth/register_screen.dart';
import 'package:sew_hun/screens/landing/splash_screen.dart';
import 'package:sew_hun/screens/youtube/youtube_video_player_screen.dart';
import 'package:sew_hun/screens/youtube/youtube_videos_screen.dart';


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
          initialRoute: SplashScreen.id,
          routes: {
            '/': (context) => SplashScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegisterScreen.id: (context) => RegisterScreen(),
            LandingScreen.id: (context) => LandingScreen(),
            BlogListScreen.id: (context) => BlogListScreen(),
            BlogDetailScreen.id: (context) => BlogDetailScreen(),
            CommentsScreen.id: (context) => CommentsScreen(),
            ProfileScreen.id: (context) => ProfileScreen(),
            MessagesScreen.id: (context) => MessagesScreen(),
            ChatsScreen.id: (context) => ChatsScreen(),
            RecordScreen.id: (context) => RecordScreen(),
            AdminChooserScreen.id: (context) => AdminChooserScreen(),
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
