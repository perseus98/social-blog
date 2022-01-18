import 'package:flutter/material.dart';
import 'package:social_blog/screens/home_screen.dart';
class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
