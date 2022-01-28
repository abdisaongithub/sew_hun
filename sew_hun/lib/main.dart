import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog_list_screen.dart';
import 'package:sew_hun/screens/landing_screen.dart';
import 'package:sew_hun/screens/login_screen.dart';
import 'package:sew_hun/screens/splash_screen.dart';

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
          },
        );
      },
    );
  }
}
