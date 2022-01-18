import 'package:flutter/material.dart';
import 'package:social_blog/config/screen_routes.dart';
import 'package:social_blog/screens/auth_screen.dart';
import 'package:social_blog/screens/home_screen.dart';
import 'package:social_blog/screens/init_screen.dart';
class SocialBlogApp extends StatelessWidget {
  const SocialBlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Social Blog Application",
      initialRoute: ScreenRoutes.initScreen,
      routes: {
        ScreenRoutes.initScreen : (context) => InitScreen(),
        ScreenRoutes.authScreen : (context) => AuthScreen(),
        ScreenRoutes.homeScreen : (context) => HomeScreen(),
      },
    );
  }
}
